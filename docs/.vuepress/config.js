module.exports = {
    head: [
        ['link', { rel: 'icon', href: 'https://s3.eu-west-3.amazonaws.com/juke-github/ico.png' }],
    ],
    title: "fyle",
    description: "web asset conversion, optimization and processing",
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
                'Contributing',
            ],
            '/': [
                '',
            ]
        }
    }
}