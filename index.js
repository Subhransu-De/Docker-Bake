const express = require("express");
const app = express();
const port = 8080;

app.get("/", (req, res) => {
  res.send(`
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh; text-align: center;">
      <div>
        <h1>Hello World!</h1>
      </div>
    </div>
  `);
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
