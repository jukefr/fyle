module.exports = {
    base: "/fyle/",
    themeConfig: {
        nav: [
            {text: 'Home', link: '/'},
            {text: 'Guide', link: '/guide/'},
            {text: 'GitHub', link: 'https://github.com/jukefr/fyle'},
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
