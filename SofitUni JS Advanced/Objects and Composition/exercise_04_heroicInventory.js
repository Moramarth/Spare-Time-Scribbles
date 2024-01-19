function heroicInventory(stringsArray) {
    const heroes = [];

    stringsArray.map((string) => {
        let [heroName, level, items] = string.split(" / ");

        heroes.push({
            name: heroName,
            level: Number(level),
            items: items ? items.split(", ") : [],
        });
    });
    console.log(JSON.stringify(heroes));
}