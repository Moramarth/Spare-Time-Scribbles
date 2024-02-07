function getArticleGenerator(articles) {
    const articlesArray = []
    const contentContainer = document.querySelector('#content')
    for (const article of articles) {
        articlesArray.push(article)
    }

    return () => {
        if (articlesArray.length !== 0) {
            const article = document.createElement('article')
            contentContainer.appendChild(article)
            article.textContent = articlesArray.shift()
        }
    }

}
