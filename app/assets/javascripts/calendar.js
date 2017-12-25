/**
 * Created by lenafaure on 20/09/2017.
 */
$( document ).on('turbolinks:load', function(){

// Array polyfill for IE: find
if (!Array.prototype.find) {
    Object.defineProperty(Array.prototype, 'find', {
        value: function(predicate) {
            // 1. Let O be ? ToObject(this value).
            if (this == null) {
                throw new TypeError('"this" is null or not defined');
            }

            var o = Object(this);

            // 2. Let len be ? ToLength(? Get(O, "length")).
            var len = o.length >>> 0;

            // 3. If IsCallable(predicate) is false, throw a TypeError exception.
            if (typeof predicate !== 'function') {
                throw new TypeError('predicate must be a function');
            }

            // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
            var thisArg = arguments[1];

            // 5. Let k be 0.
            var k = 0;

            // 6. Repeat, while k < len
            while (k < len) {
                // a. Let Pk be ! ToString(k).
                // b. Let kValue be ? Get(O, Pk).
                // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
                // d. If testResult is true, return kValue.
                var kValue = o[k];
                if (predicate.call(thisArg, kValue, k, o)) {
                    return kValue;
                }
                // e. Increase k by 1.
                k++;
            }

            // 7. Return undefined.
            return undefined;
        }
    });
}

// Array polyfill for IE: findIndex
    if (!Array.prototype.findIndex) {
        Object.defineProperty(Array.prototype, 'findIndex', {
            value: function(predicate) {
                // 1. Let O be ? ToObject(this value).
                if (this == null) {
                    throw new TypeError('"this" is null or not defined');
                }

                var o = Object(this);

                // 2. Let len be ? ToLength(? Get(O, "length")).
                var len = o.length >>> 0;

                // 3. If IsCallable(predicate) is false, throw a TypeError exception.
                if (typeof predicate !== 'function') {
                    throw new TypeError('predicate must be a function');
                }

                // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
                var thisArg = arguments[1];

                // 5. Let k be 0.
                var k = 0;

                // 6. Repeat, while k < len
                while (k < len) {
                    // a. Let Pk be ! ToString(k).
                    // b. Let kValue be ? Get(O, Pk).
                    // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
                    // d. If testResult is true, return k.
                    var kValue = o[k];
                    if (predicate.call(thisArg, kValue, k, o)) {
                        return k;
                    }
                    // e. Increase k by 1.
                    k++;
                }

                // 7. Return -1.
                return -1;
            }
        });
    }

function init() {
    var today = moment();

    function Calendar(selector, time_slots) {
        this.el = document.querySelector(selector);
        this.time_slots = time_slots;
        this.current = moment().startOf('week');
        this.selection = JSON.parse(localStorage.getItem('availabilities')) || [];
        this.draw_calendar();
    }

    Calendar.prototype.draw_calendar = function() {
        // Draw Header
        this.draw_header();

        // Draw Week
        this.draw_week();
        console.log(2);
    }

    Calendar.prototype.draw_header = function() {
        // Refer to Calendar Object with "self" when "this" refers to an event
        var self = this;

        if(!this.header) {
            // Create header elements
            this.header = createElement('div', 'header');
            this.title = createElement('h1');

            var right = createElement('div', 'right');
            right.addEventListener('click', function () {
                self.next_week();
            });

            var left = createElement('div', 'left');
            left.addEventListener('click', function () {
                self.prev_week();
            });

            // Append header elements to Calendar
            this.header.appendChild(this.title);
            this.header.appendChild(right);
            this.header.appendChild(left);
            this.el.appendChild(this.header);
        }

        this.title.innerHTML = "Semaine " + this.current.week();
    }

    Calendar.prototype.draw_week = function() {
        var self = this;
        if(this.week){
            this.old_week = this.week;
            this.old_week.className = 'week out ' + (self.next ? 'next' : 'prev');
            this.old_week.addEventListener('webkitAnimationEnd', function() {
                self.old_week.parentNode.removeChild(self.old_week);
                self.week = createElement('div', 'week');
                self.current_week();
                self.el.appendChild(self.week);
                window.setTimeout(function() {
                    self.week.className = 'week in ' + (self.next ? 'next' : 'prev');
                }, 16);
            });
        }
        else {
            this.week = createElement('div', 'week');
            this.el.appendChild(this.week);
            this.current_week();
            this.week.className = 'week current';
        }
    }

    Calendar.prototype.current_week = function() {
        var clone = this.current.clone();
        while(clone.week() === this.current.week() && clone.day() !== 6) {
            clone.add(1, 'days');
            this.draw_day(clone);
        }
    }

    Calendar.prototype.next_week = function() {
        this.current.add(1, 'weeks');
        this.next = true;
        console.log(1);
        this.draw_calendar();
    }

    Calendar.prototype.prev_week = function() {
        this.current.subtract(1, 'weeks');
        this.next = false;
        this.draw_calendar();
    }

    Calendar.prototype.draw_day = function(day) {

        if (this.get_day_class(day).indexOf('other') == -1) {

            var day_wrapper = createElement('div', this.get_day_class(day));
            var day_name = createElement('div', 'day-name', day.locale('fr').format('ddd'));
            var day_number = createElement('div', 'day-number', day.format('DD'));
            var day_month = createElement('div', 'day-month', day.locale('fr').format('MMM'));
            var day_slot = createElement('div', 'day-slot', '', 'data-date', day.format('YYYY-MM-DD'));

            if(day.day() <= 5) {
                this.draw_time_slot(day, day_slot);
            }
            day_wrapper.appendChild(day_name);
            day_wrapper.appendChild(day_number);
            day_wrapper.appendChild(day_month);
            day_wrapper.appendChild(day_slot);
            this.week.appendChild(day_wrapper);

        }
    }

    Calendar.prototype.draw_time_slot = function(day, element) {
        var self = this;
        var today_time_slot;
        var is_during_holiday = is_holiday(day);

        if (is_during_holiday) {
            today_time_slot = this.time_slots.find(function(element) {
                return element.holiday == true && element.weekday == day.day();
            })
        } else {
            today_time_slot = this.time_slots.find(function(element) {
                return element.holiday == false  && element.weekday == day.day();
            })
        }

        var selected_slots = localStorage.getItem('availabilities');

        if(today_time_slot) {
            today_time_slot.slots.forEach(function(ts)  {
                var ts_span = createElement('div', 'time-slot', ts, 'data-event', ts);

                if(selected_slots){
                    if(selected_slots.indexOf(JSON.stringify([day.format('YYYY-MM-DD'), ts])) != -1 ){
                        ts_span.className = "time-slot selected";
                    }
                }

                element.appendChild(ts_span);

                ts_span.addEventListener('click', function () {
                    self.select_time_slot(this, day);
                });
            });
        }
    }

    // A function to add a different class to "today"
    Calendar.prototype.get_day_class = function(day) {
        classes = ['day'];

        if(day.week() !== this.current.week()) {
            classes.push('other');
        }
        else if(today.isSame(day, 'day')) {
            classes.push('today');
        }
        return classes.join(' ');
    }

    Calendar.prototype.select_time_slot = function(element) {
        var element_data = [element.parentNode.getAttribute('data-date'),element.getAttribute('data-event')];

        if(element.className.indexOf('selected') != -1) {
            element.className = "time-slot";

            // Find and remove element in selections array
            var element_index = this.selection.findIndex(function(item){
                return JSON.stringify(item) == JSON.stringify(element_data);
            });

            this.selection.splice(element_index, 1);
        }
        else {
            element.className = "time-slot selected";
            this.selection.push(element_data);
        }

        localStorage.setItem('availabilities', JSON.stringify(this.selection));
    }

    // A function to create html elements
    function createElement(tagName, className, innerText, dataAttributeName, dataAttributeValue) {
        var html_element = document.createElement(tagName);
        if(className) {
            html_element.className = className;
        }
        if(innerText) {
            html_element.innerText = html_element.textContent = innerText;
        }
        if(dataAttributeName && dataAttributeValue) {
            html_element.setAttribute(dataAttributeName, dataAttributeValue);
        }
        return html_element;
    }

    // Send localstorage data to controller on validate
    var validate_availabilities = document.querySelector('#calendar_validate');

    function onAvailabilityValidate() {
        var JsonLocalStorageObj = localStorage["availabilities"];
        $.ajax({
            url: "/availabilities",
            type: "POST",
            data: {availability : JSON.parse(JsonLocalStorageObj)},
            success: function (data) {
            }
        });
    }

    if (validate_availabilities) {
        validate_availabilities.addEventListener('click', onAvailabilityValidate);
    }


    window.Calendar = Calendar;
    build_calendar();

};

function build_calendar() {

    // Populate Localstorage with database entries
    if(document.querySelector('#calendar')) {
        var persisted_availabilities = document.querySelector('#calendar').getAttribute('data-persisted');
        var user_availabilities_array = [];
    }

    if(persisted_availabilities) {
        JSON.parse(persisted_availabilities).forEach(function (availability) {
            var user_time_slot = [];
            user_time_slot.push(availability.date);
            user_time_slot.push(availability.time_slot);
            user_availabilities_array.push(user_time_slot);
        });
    }
    localStorage.removeItem('availabilities');
    localStorage.setItem('availabilities', JSON.stringify(user_availabilities_array));

    var calendar = new Calendar('#calendar', TimeSlots);
};

    init();
});

