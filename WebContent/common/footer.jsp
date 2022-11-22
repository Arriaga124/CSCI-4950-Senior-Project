<style>
.footer {
	height: 50px;
	width:100%;
    bottom: 0;
    position: fixed;
    background-color: rgb(34,93,196);
}
</style>

<footer class="footer font-small black"> 
	<p class="text-left text-white pt-3 ml-3">Last Checked: <%=session.getAttribute("checkedDate")%></p>
</footer>
