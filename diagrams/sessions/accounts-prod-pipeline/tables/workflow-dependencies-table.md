| **Board**           | **Key Columns**                               | **Statuses**                                 | **Blocks**                      | **Blocked By**                      |
|---------------------|-----------------------------------------------|----------------------------------------------|----------------------------------|--------------------------------------|
| **Vendors**         | Contact Info, Comms Log                      | —                                            | EPO fulfillment                  | —                                    |
| **Purchasing (EPOs)** | Vendor                                        | `Ordered`, `Received`                        | SKU Production (on Prod board)   | Vendor communication (Vendors)      |
| **Bulk Traceability** | Trace Log                                     | `Complete`, `Pending`                        | SKU Production                   | Purchasing (EPOs)                    |
| **Line Work**       | Line Steps                                    | `Done`, `In Progress`                        | SKU Production                   | Bulk Traceability                    |
| **Production (SKUs)** | —                                             | `Waiting on EPOs`, `Compounding`, `Line Work Done`, `Ready to Ship` | Final Payment on IPO (Prod Deals) | EPOs, Bulk Traceability, Line Work |
| **Prod Deals (IPOs)** | Payment Status, SKU Status                    | `Ready to Ship`                              | —                                | Production board (SKU readiness)     |
