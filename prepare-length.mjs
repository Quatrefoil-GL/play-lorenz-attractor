import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
assert.equal(process.env.GITHUB_ACTIONS,'true');assert.equal(process.platform,'linux');
const run=(exe,args)=>execFileSync(exe,args,{encoding:'utf8',maxBuffer:32e6,stdio:['pipe','pipe','pipe']});
assert.equal(run('calcit',['-v']).trim(),'0.30.1');
const norm=v=>Array.isArray(v)?v.map(norm):v&&typeof v==='object'?Object.fromEntries(Object.entries(v).map(([k,x])=>[k,k==='__edn_set'?x.map(norm).sort((a,b)=>JSON.stringify(a).localeCompare(JSON.stringify(b))):k==='schema'&&Array.isArray(x)&&x[0]==='{}'?['{}',...x.slice(1).map(norm).sort((a,b)=>a[0].localeCompare(b[0]))]:norm(x)])):v;
const q=(...args)=>{const r=JSON.parse(run('calcit',['query',...args,'--format','json']));assert.ok(!r.diagnostics?.some(d=>d.severity==='error'));return norm(r.data);};
function views(){const namespaces=[],defs=[];for(const ns of q('ns').namespaces){const info=q('ns',ns);namespaces.push(info);const names=run('calcit',['query','defs',ns]).split('\n').filter(l=>/^  \S/.test(l)).map(l=>l.trim().split(' ')[0]);assert.equal(names.length,info.definition_count);for(const n of names)defs.push(q('def',ns+'/'+n));}return {config:q('config'),namespaces,defs};}
const p=JSON.parse(readFileSync('reviewed-source.json'));const expected=norm(structuredClone(p.before));
const split=expected.defs.find(d=>d.id==='app.math/split-segments');assert.deepEqual(split.code[3][1][0][1],['count','points']);split.code[3][1][0][1][0]='.len';
const gen=expected.defs.find(d=>d.id==='app.math/gen-lorenz-seq');assert.equal(gen.tests.length,1);assert.equal(gen.tests[0].code[3][2][0],'count');gen.tests[0].code[3][2][0]='.len';
const blob=()=>run('git',['hash-object','calcit.cirru']).trim();mkdirSync('acceptance',{recursive:true});
if(process.argv[2]==='apply'){
 assert.equal(blob(),p.blob);assert.deepEqual(views(),norm(p.before));
 const operations=[['tree','replace',split.id,'--path','@3.1.0.1.0','--input-format','json-ast','--code','".len"'],['edit','add-test',gen.id,gen.tests[0].name,'--overwrite','--input-format','json-ast','--code',JSON.stringify(gen.tests[0].code)]];
 writeFileSync('acceptance/before-subtree.json',run('calcit',['tree','show',split.id,'--path','@3.1.0.1','--format','json']));
 writeFileSync('acceptance/operations.json',JSON.stringify(operations));writeFileSync('acceptance/expected-source.json',JSON.stringify(expected));
 const args=['edit','transaction','--file','acceptance/operations.json','--format','json'];const dry=JSON.parse(run('calcit',[...args,'--dry-run']));assert.ok(dry.scoped_revision);writeFileSync('acceptance/preview.json',JSON.stringify(dry));writeFileSync('acceptance/applied.json',run('calcit',[...args,'--expect-revision',dry.scoped_revision]));
 writeFileSync('acceptance/after-subtree.json',run('calcit',['tree','show',split.id,'--path','@3.1.0.1','--format','json']));writeFileSync('acceptance/modified-blob.txt',blob());
} else assert.equal(process.argv[2],'verify');
assert.deepEqual(views(),expected);assert.equal(blob(),readFileSync('acceptance/modified-blob.txt','utf8'));
for(const [file,hash]of Object.entries(p.ordinaryBlobs))assert.equal(run('git',['hash-object',file]).trim(),hash,file);
writeFileSync('acceptance/actual-source.json',JSON.stringify(views()));
if(process.argv[2]==='verify'){
 const manifest=name=>new Map(readFileSync('acceptance/'+name+'-js.sha256','utf8').trim().split('\n').map(l=>{const m=l.match(/^([a-f0-9]{64})  (.+)$/);assert.ok(m);return[m[2],m[1]];}));const before=manifest('before'),after=manifest('after');assert.ok(before.size>0);assert.deepEqual([...before.keys()],[...after.keys()]);const changed=[...before.keys()].filter(f=>before.get(f)!==after.get(f));assert.ok(changed.every(f=>f==='js-out/app.math.mjs'));writeFileSync('acceptance/generated-js-evidence.json',JSON.stringify({files:before.size,changed,otherFilesIdentical:true}));
}
writeFileSync('acceptance/source-evidence.json',JSON.stringify({before:p.blob,after:blob(),definitions:expected.defs.length,namespaces:expected.namespaces.length,fullViewsMatch:true,ordinaryFilesUnchanged:true}));
