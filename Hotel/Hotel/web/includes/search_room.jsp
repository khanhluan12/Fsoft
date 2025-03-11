<!doctype html>
<html lang="en">
    <body class="">

        <form action="checkRoomValid" method="get" onsubmit="return validateForm()" name="myForm">
            <div class=" row maindiv bg-secondary p-4, form_day">
                <div class="col-4">
                    <div>
                        <label><b class="text-white">Check In Date</b></label>
                    </div>
                    <input type="date" class="form-control"  name="check_in" id="check_in"   required/>
                    <span id="checkin" class="error"></span>
                </div>
                <div class="col-4">
                    <div>
                        <label><b class="text-white">Check Out Date</b></label>
                    </div>
                    <input type="date" class="form-control " name="check_out" id="check_out"  required />
                    <span id="checkout" class="error"></span>
                </div>

                <div class="col-2 mt-3 px-5 btn">
                    <input type="submit"  class="btn bg-primary text-white" value="Search Availability" />
                </div>
            </div>
        </form>
        <style>
            .error {
                color: darkred;
                font-weight: bold;
            }
        </style>
        <script type="text/javascript">
            function setMinDate() {
                var dtToday = new Date();

                // Increment the date by one day to set tomorrow's date
                dtToday.setDate(dtToday.getDate() + 1);

                var month = dtToday.getMonth() + 1;
                var day = dtToday.getDate();
                var year = dtToday.getFullYear();

                // Format month and day with leading zeros if needed
                if (month < 10) {
                    month = '0' + month.toString();
                }
                if (day < 10) {
                    day = '0' + day.toString();
                }

                var minDate = year + '-' + month + '-' + day;

                // Set the min attribute for check-in and check-out date inputs
                document.getElementById('check_in').setAttribute('min', minDate);
                document.getElementById('check_out').setAttribute('min', minDate);

                console.log(minDate);
            }

            setMinDate();
;
            document.getElementById('check_in').addEventListener('change', handleDateChange);
            document.getElementById('check_out').addEventListener('change', handleDateChange);

            function handleDateChange() {
                const currentDate = new Date();
                currentDate.setDate(currentDate.getDate() - 1);
                var checkInDate = new Date(document.getElementById('check_in').value);
                var checkOutDate = new Date(document.getElementById('check_out').value);

                if (checkOutDate <= checkInDate) {
                    document.getElementById('checkout').textContent = 'Your checkout date is less than or equal checkin date.';
                    document.getElementById('check_out').value = '';
                } else if (checkOutDate <= currentDate) {
                    document.getElementById('checkout').textContent = 'Your checkout date is less than or equal currentDate.';
                    document.getElementById('check_out').value = '';
                } else {
                    document.getElementById('checkout').textContent = '';
                }

                if (checkInDate <= currentDate) {
                    document.getElementById('checkin').textContent = 'Your checkin date is less than current date.';
                    document.getElementById('check_in').value = '';
                } else {
                    document.getElementById('checkin').textContent = '';
                }
            }
        </script>

        <script src="../js/formValidation.js" type="text/javascript"></script>
    </body>
</html>