module.exports = {
    head: [
        ['link', { rel: 'icon', href: 'https://s3.eu-west-3.amazonaws.com/juke-github/ico.png' }],
    ],
    title: "fyle",
    description: "process any web asset easily",
    ga: "UA-124031707-1",
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
                'fhub',
                'CLI',
                'Contributing',
            ],
            '/': [
                '',
            ]
        }
    }
};