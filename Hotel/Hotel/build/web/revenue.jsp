

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Revenue Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">
        <h2>Monthly Revenue Chart</h2>
        <canvas id="revenueChart"></canvas>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            fetch('${pageContext.request.contextPath}/revenueData')
                .then(response => response.json())
                .then(data => {
                    // Ensure correct labels for 12 months
                    const labels = ['Month 1', 'Month 2', 'Month 3', 'Month 4', 'Month 5', 'Month 6', 'Month 7', 'Month 8', 'Month 9', 'Month 10', 'Month 11', 'Month 12'];
                    const revenues = new Array(12).fill(0);

                    // Fill the revenues array with data
                    data.forEach(item => {
                        const monthIndex = item.month - 1;
                        revenues[monthIndex] = item.revenue;
                    });

                    const ctx = document.getElementById('revenueChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Revenue',
                                data: revenues,
                                borderColor: 'rgba(75, 192, 192, 1)',
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                fill: true
                            }]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                x: {
                                    beginAtZero: true
                                },
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                });
        });
    </script>
</body>
</html>
