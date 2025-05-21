<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Phu Dev - Dự án laptopshop" />
        <meta name="author" content="Phu Dev" />
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <style>
          .stat-card {
            border: none;
            border-radius: 15px;
            transition: transform 0.3s ease;
            overflow: hidden;
          }

          .stat-card:hover {
            transform: translateY(-5px);
          }

          .stat-icon {
            font-size: 2.5rem;
            opacity: 0.8;
          }

          .stat-value {
            font-size: 2rem;
            font-weight: 600;
          }

          .stat-label {
            font-size: 1rem;
            opacity: 0.8;
          }

          .system-info-card {
            border: none;
            border-radius: 15px;
            background: #fff;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
          }

          .info-item {
            padding: 1rem;
            border-bottom: 1px solid #f0f0f0;
          }

          .info-item:last-child {
            border-bottom: none;
          }

          .info-label {
            color: #6c757d;
            font-size: 0.875rem;
          }

          .info-value {
            color: #2c3e50;
            font-weight: 500;
          }

          .chart-container {
            background: #fff;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
          }
        </style>
      </head>

      <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
          <jsp:include page="../layout/sidebar.jsp" />
          <div id="layoutSidenav_content">
            <main>
              <div class="container-fluid px-4">
                <div class="d-flex justify-content-between align-items-center mt-4">
                  <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                  <div class="breadcrumb mb-0">
                    <ol class="breadcrumb mb-0">
                      <li class="breadcrumb-item active">Statistics</li>
                    </ol>
                  </div>
                </div>

                <!-- Statistics Cards -->
                <div class="row mt-4">
                  <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card stat-card bg-primary text-white">
                      <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                          <div>
                            <div class="stat-value">${countUsers}</div>
                            <div class="stat-label">Total Users</div>
                          </div>
                          <div class="stat-icon">
                            <i class="fas fa-users"></i>
                          </div>
                        </div>
                      </div>
                      <div class="card-footer bg-transparent border-0">
                        <a href="/admin/user"
                          class="text-white text-decoration-none d-flex justify-content-between align-items-center">
                          <span>View Details</span>
                          <i class="fas fa-arrow-right"></i>
                        </a>
                      </div>
                    </div>
                  </div>

                  <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card stat-card bg-success text-white">
                      <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                          <div>
                            <div class="stat-value">${countProducts}</div>
                            <div class="stat-label">Total Products</div>
                          </div>
                          <div class="stat-icon">
                            <i class="fas fa-laptop"></i>
                          </div>
                        </div>
                      </div>
                      <div class="card-footer bg-transparent border-0">
                        <a href="/admin/product"
                          class="text-white text-decoration-none d-flex justify-content-between align-items-center">
                          <span>View Details</span>
                          <i class="fas fa-arrow-right"></i>
                        </a>
                      </div>
                    </div>
                  </div>

                  <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card stat-card bg-warning text-white">
                      <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                          <div>
                            <div class="stat-value">${countOrders}</div>
                            <div class="stat-label">Total Orders</div>
                          </div>
                          <div class="stat-icon">
                            <i class="fas fa-shopping-cart"></i>
                          </div>
                        </div>
                      </div>
                      <div class="card-footer bg-transparent border-0">
                        <a href="/admin/order"
                          class="text-white text-decoration-none d-flex justify-content-between align-items-center">
                          <span>View Details</span>
                          <i class="fas fa-arrow-right"></i>
                        </a>
                      </div>
                    </div>
                  </div>

                  <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card stat-card bg-info text-white">
                      <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                          <div>
                            <div class="stat-value">
                              <fmt:formatNumber type="number" value="${totalRevenue}" />đ
                            </div>
                            <div class="stat-label">Total Revenue</div>
                          </div>
                          <div class="stat-icon">
                            <i class="fas fa-dollar-sign"></i>
                          </div>
                        </div>
                      </div>
                      <div class="card-footer bg-transparent border-0">
                        <a href="/admin/order"
                          class="text-white text-decoration-none d-flex justify-content-between align-items-center">
                          <span>View Details</span>
                          <i class="fas fa-arrow-right"></i>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Charts and System Info -->
                <div class="row">
                  <!-- Sales Chart -->
                  <div class="col-xl-8 mb-4">
                    <div class="chart-container">
                      <h5 class="card-title mb-4">Sales Overview</h5>
                      <canvas id="salesChart" width="100%" height="40"></canvas>
                    </div>
                  </div>

                  <!-- System Information -->
                  <div class="col-xl-4 mb-4">
                    <div class="system-info-card">
                      <div class="card-header bg-transparent">
                        <h5 class="card-title mb-0">System Information</h5>
                      </div>
                      <div class="card-body p-0">
                        <div class="info-item">
                          <div class="info-label">Server Status</div>
                          <div class="info-value text-success">
                            <i class="fas fa-circle me-2"></i>Online
                          </div>
                        </div>
                        <div class="info-item">
                          <div class="info-label">Last Backup</div>
                          <div class="info-value">
                            <fmt:formatDate value="${lastBackup}" pattern="dd/MM/yyyy HH:mm" />
                          </div>
                        </div>
                        <div class="info-item">
                          <div class="info-label">Active Users</div>
                          <div class="info-value">${activeUsers}</div>
                        </div>
                        <div class="info-item">
                          <div class="info-label">System Version</div>
                          <div class="info-value">1.0.0</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Recent Orders -->
                <div class="row">
                  <div class="col-12 mb-4">
                    <div class="card shadow-sm">
                      <div class="card-header bg-white">
                        <h5 class="card-title mb-0">Recent Orders</h5>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <table class="table table-hover align-middle">
                            <thead class="table-light">
                              <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="order" items="${recentOrders}">
                                <tr>
                                  <td>#${order.id}</td>
                                  <td>${order.user.fullName}</td>
                                  <td>
                                    <fmt:formatNumber type="number" value="${order.totalPrice}" />đ
                                  </td>
                                  <td>
                                    <span
                                      class="badge bg-${order.status == 'COMPLETE' ? 'success' : order.status == 'PENDING' ? 'warning' : order.status == 'SHIPPING' ? 'info' : 'danger'}">
                                      ${order.status}
                                    </span>
                                  </td>
                                  <td>
                                    <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy" />
                                  </td>
                                </tr>
                              </c:forEach>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
          </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
        <script>
          // Initialize Sales Overview Chart
          const salesCtx = document.getElementById("salesChart").getContext("2d");
          const salesChart = new Chart(salesCtx, {
            type: "bar",
            data: {
              labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
              datasets: [
                {
                  label: "Monthly Sales",
                  data: [
                    12000000, 19000000, 15000000, 25000000, 22000000, 30000000,
                  ],
                  backgroundColor: "rgba(75, 192, 192, 0.6)",
                  borderColor: "rgba(75, 192, 192, 1)",
                  borderWidth: 1,
                },
              ],
            },
            options: {
              responsive: true,
              plugins: {
                legend: {
                  position: "top",
                },
                title: {
                  display: true,
                  text: "Monthly Sales Overview",
                },
                tooltip: {
                  callbacks: {
                    label: function (context) {
                      let label = context.dataset.label || "";
                      if (label) {
                        label += ": ";
                      }
                      if (context.parsed.y !== null) {
                        label += new Intl.NumberFormat("vi-VN", {
                          style: "currency",
                          currency: "VND",
                        }).format(context.parsed.y);
                      }
                      return label;
                    },
                  },
                },
              },
              scales: {
                y: {
                  beginAtZero: true,
                  ticks: {
                    callback: function (value) {
                      return new Intl.NumberFormat("vi-VN", {
                        style: "currency",
                        currency: "VND",
                        maximumFractionDigits: 0,
                      }).format(value);
                    },
                  },
                },
              },
            },
          });
        </script>
      </body>

      </html>