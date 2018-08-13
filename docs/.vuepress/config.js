module.exports = {
    base: "/fyle/",
    themeConfig: {
        nav: [
            {text: 'Home', link: '/'},
            {text: 'Guide', link: '/guide/'},
            // {text: 'External', link: 'https://google.com'},
        ],
        sidebar: {
            '/guide/': [
                '',
                'foptimize',
                'fconvert',
                'futils',
            ],

            // fallback
            '/': [
                '', /* / */
                // 'guide', /* /guide*/
            ]
        }
    }
}
