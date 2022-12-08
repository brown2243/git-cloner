const fs = require("fs");

const fileName = process.argv[2];

try {
  const data = fs.readFileSync(fileName, "utf8");
  for (const val of JSON.parse(data)) {
    console.log(`${val.clone_url};`);
  }
} catch (err) {
  console.error(err);
}
