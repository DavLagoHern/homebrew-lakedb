import { readFile, writeFile } from 'node:fs/promises';

const [caskPath, version, sha256] = process.argv.slice(2);
if (!caskPath || !/^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$/.test(version ?? '')) {
  throw new Error('Usage: node scripts/update-cask.mjs <cask> <version> <sha256>');
}
if (!/^[0-9a-f]{64}$/.test(sha256 ?? '')) throw new Error(`Invalid SHA-256: ${sha256}`);

const source = await readFile(caskPath, 'utf8');
const updated = source
  .replace(/^  version ".*"$/m, `  version "${version}"`)
  .replace(/^  sha256 ".*"$/m, `  sha256 "${sha256}"`);

if (!updated.includes(`version "${version}"`) || !updated.includes(`sha256 "${sha256}"`)) {
  throw new Error('Could not update the cask version and checksum stanzas.');
}

await writeFile(caskPath, updated);
