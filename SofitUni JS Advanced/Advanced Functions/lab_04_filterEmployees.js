function filterEmployees(data, filter) {
    data = JSON.parse(data);

    if (filter !== 'all') {
        const [key, value] = filter.split('-');
        data = data.filter(employee => employee[key] === value);
    };

    for (const employee of data) {
        console.log(`${data.indexOf(employee)}. ${employee.first_name} ${employee.last_name} - ${employee.email}`);
    };
}