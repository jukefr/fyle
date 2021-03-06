const puppeteer = require("puppeteer");
(async () => {
    const browser = await puppeteer.launch({args: ['--no-sandbox']});
    const page = await browser.newPage();
    await page.goto("https://hub.docker.com/sso/start/");
    await page.type("#nw_username", "futils");
    await page.type("#nw_password", "$HUB_PW");
    await page.click("#nw_submit");
    await page.waitFor(1000);
    await page.goto("https://hub.docker.com/add/automated-build/$TMP_SERVICE_NAME/github/orgs/");
    const search = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div[2]/div/div/div/form/div/div[1]/input");
    await Promise.all(search.map(handle => handle.type("fyle")));
    await page.waitFor(1000);
    const result = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div[2]/div/ul/li/a");
    await Promise.all(result.map(handle => handle.click()));
    await page.waitFor(1000);
    const tool = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[1]/div[1]/div[2]/div[2]/div/input");
    await Promise.all(tool.map(handle => {
        handle.click({clickCount: 3})
    }));
    await page.waitFor(500);
    await Promise.all(tool.map(handle => {
        handle.type("$TMP_TOOL_NAME")
    }));
    await page.waitFor(500);
    const description = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[3]/textarea");
    await Promise.all(description.map(handle => handle.type("$TMP_SERVICE_NAME/$TMP_TOOL_NAME")));
    await page.waitFor(500);
    const customizeLink = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div/div/form/label[2]/a");
    await Promise.all(customizeLink.map(handle => handle.click()));
    const dockerfile1 = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[2]/div[3]/input");
    await Promise.all(dockerfile1.map(handle => { handle.click({clickCount: 3}) }));
    await page.waitFor(500);
    await Promise.all(dockerfile1.map(handle => handle.type("$TMP_SERVICE_NAME/$TMP_TOOL_NAME/Dockerfile")));
    await page.waitFor(500);
    const dockerfile2 = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[3]/div[3]/input");
    await Promise.all(dockerfile2.map(handle => { handle.click({clickCount: 3}) }));
    await page.waitFor(500);
    await Promise.all(dockerfile2.map(handle => handle.type("$TMP_SERVICE_NAME/$TMP_TOOL_NAME/Dockerfile")));
    await page.waitFor(500);
    await page.select("#app > main > div:nth-child(3) > div.row > div > div > div > form > div:nth-child(6) > div > div:nth-child(3) > div:nth-child(1) > select", "Tag");

    // Add third build option for release/() -> v()
    // First time will need to be manually pushed though
    const newRowButton = await page.$x("//*[@id=\"row-0\"]/i");
    await Promise.all(newRowButton.map(handle => { handle.click() }));
    await page.waitFor(500);

    const newRowName = await page.$x("//*[@id=\"app\"]/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[4]/div[2]/input");
    await Promise.all(newRowName.map(handle => { handle.click() }));
    await page.waitFor(500);
    await Promise.all(newRowName.map(handle => handle.type("/release\\/([0-9.].*)/")));
    await page.waitFor(500);

    const newRowDockerfile = await page.$x("//*[@id=\"app\"]/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[4]/div[3]/input");
    await Promise.all(newRowDockerfile.map(handle => { handle.click({clickCount: 3}) }));
    await page.waitFor(500);
    await Promise.all(newRowDockerfile.map(handle => handle.type("$TMP_SERVICE_NAME/$TMP_TOOL_NAME/Dockerfile")));
    await page.waitFor(500);

    const newRowTag = await page.$x("//*[@id=\"app\"]/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[4]/div[4]/input");
    await Promise.all(newRowTag.map(handle => { handle.click() }));
    await page.waitFor(500);
    await Promise.all(newRowTag.map(handle => handle.type("v{\\1}")));
    await page.waitFor(500);


    const submitForm = await page.$x("//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[5]/div/button");
    await Promise.all(submitForm.map(handle => handle.click()));
    await page.waitFor(2000);

    await browser.close();
})();