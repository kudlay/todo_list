                        <?php if(isset($_SESSION["logged_in"])) : ?>
                        <div class="row">
                            <div class="col-xs-12 footer">
                                <button id="add_project" class="btn btn-lg btn-primary add_project" onclick="Add_project();"><span class="glyphicon glyphicon-plus"></span> Add TODO List</button>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>