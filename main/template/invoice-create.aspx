<%@ Page Title="invoice" Language="C#" MasterPageFile="~/main/template/mainDashboard.Master" AutoEventWireup="true" CodeBehind="invoice-create.aspx.cs" Inherits="invoice_task.main.template.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles">
                <div class="col p-md-0">
                    <h4>Create Invoice</h4>
                </div>
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Create Invoice</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <asp:Button runat="server" Text="Save bill in DB"  id="saveDbBtn" OnClick="saveDbBtn_Click" CssClass="btn btn-primary btn-sl-lg mr-3"></asp:Button>

                                    <button class="btn btn-info " id="deleteSelectedRow">Delete selected rows</button>

                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-lg-12">
                                    <div class="create-invoice-table table-responsive">
                                        <table runat="server" id="table" class="table invoice-details-table"  style="min-width: 620px;">
                                            <thead>
                                                <tr>
                                                    <th>Manage</th>
                                                    <th>Items</th>
                                                    <th>Quantity</th>
                                                    <th>Unit Price</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody id="itemContainer" >
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" /></td>
                                                    <td class="muted-text">item 1</td>

                                                    <td class="muted-text">
                                                        <input runat="server" style="text-align: center;" value="1" type="number">

                                                    </td>
                                                    <td class="muted-text">
                                                        <input runat="server" step="0.01" style="text-align: center;" value="1" type="number"></td>
                                                    <td class="text-primary"><span>0.00</span></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" /></td>
                                                    <td class="muted-text">item 2</td>


                                                    <td class="muted-text">
                                                        <input runat="server" style="text-align: center;" value="1" type="number">
                                                    </td>
                                                    <td class="muted-text">
                                                        <input runat="server" step="0.01" style="text-align: center;" value="1" type="number"></td>
                                                    <td class="text-primary"><span>1.00</span></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" /></td>
                                                    <td class="muted-text">item 3</td>


                                                    <td class="muted-text">
                                                        <input runat="server" style="text-align: center;" value="1" type="number">
                                                    </td>
                                                    <td class="muted-text">
                                                        <input runat="server" step="0.01" style="text-align: center;" value="1" type="number"></td>
                                                    <td class="text-primary"><span>2.20</span></td>
                                                </tr>
                                                                                                <tr>
                                                    <td>
                                                        <input type="checkbox" /></td>
                                                    <td class="muted-text">item 4</td>


                                                    <td class="muted-text">
                                                        <input runat="server"  style="text-align: center;" value="1" type="number">
                                                    </td>
                                                    <td class="muted-text">
                                                        <input runat="server" step="0.01" style="text-align: center;" value="1" type="number"></td>
                                                    <td class="text-primary"><span>2.20</span></td>
                                                </tr>
                                                                                                <tr>
                                                    <td>
                                                        <input type="checkbox" /></td>
                                                    <td class="muted-text">item 5</td>


                                                    <td class="muted-text">
                                                        <input runat="server"  style="text-align: center;" value="1" type="number">
                                                    </td>
                                                    <td class="muted-text">
                                                        <input runat="server"  step="0.01" style="text-align: center;" value="1" type="number"></td>
                                                    <td class="text-primary"><span>2.20</span></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>Net</td>
                                                    <td class="text-primary" id="netValue" ClientIDMode="Static"><span>0.000</span></td>
                                                </tr>


                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #/ container -->
    </div>
</asp:Content>
