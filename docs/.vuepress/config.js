module.exports = {
    base: "/fyle/",
    themeConfig: {
        nav: [
            {text: 'Home', link: '/'},
            {text: 'Guide', link: '/guide/'},
            {text: 'Source', link: 'https://github.com/jukefr/fyle'},
        ],
        sidebar: {
            '/guide/': [
                '',
                'foptimize',
                'fconvert',
                'futils',
            ],
            '/': [
                '',
            ]
        }
    }
}
