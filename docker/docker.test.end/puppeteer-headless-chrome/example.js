const puppeteer = require("puppeteer");

const browser = await puppeteer.launch({
  headless: true,
  args: [
    "--disable-gpu",
    "--disable-dev-shm-usage",
    "--disable-setuid-sandbox",
    "--no-sandbox",
  ],
});

const page = await browser.newPage();
await page.goto("https://example.com");
const ss = await page.screenshot({ path: "/screenshot.png" });

await page.close();
await browser.close();

/*
disable-gpu – The GPU isn’t usually available inside a Docker container, unless you’ve specially configured the host. Setting this flag explicitly instructs Chrome not to try and use GPU-based rendering.
no-sandbox and disable-setuid-sandbox – These disable Chrome’s sandboxing, a step which is required when running as the root user (the default in a Docker container). Using these flags could allow malicious web content to escape the browser process and compromise the host. It’s vital you ensure your Docker containers are strongly isolated from your host. If you’re uncomfortable with this, you’ll need to manually configure working Chrome sandboxing, which is a more involved process.
disable-dev-shm-usage – This flag is necessary to avoid running into issues with Docker’s default low shared memory space of 64MB. Chrome will write into /tmp instead.
*/
