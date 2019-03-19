import time
def find_days():
    allowed_days = ['Tuesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    
    days = {str(index+1): value for index, value in enumerate(allowed_days)}
    
    output_str = '\n'.join([f'{index}. {value}' for index, value in days.items()])
    while True:
        maintenance_window_input = input(f'''Please select your desired Maintenance Window(Choose a Number): 
{output_str}
:''')
        time.sleep(1)
    
        if maintenance_window_input in days.keys():
            maintenance_window_input = days[maintenance_window_input]
            print(maintenance_window_input, 'Got it!')
            time.sleep(1)
            return maintenance_window_input
        else:
            print('please ensure proper syntax is followed')
            time.sleep(1)
    
find_days()
