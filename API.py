import requests
import pandas as pd

def fetch_country_info(country_name):
    api_url = f"https://restcountries.com/v3.1/name/{country_name}"
    
    try:
        response = requests.get(api_url)
        response.raise_for_status()
        country_data = response.json()[0]
        return country_data
    except requests.exceptions.RequestException as e:
        print(f"No API endpoint found from: {e}")
        return None

def main():
    countries_data = []

    while True:
        user_response = input("Enter a country name (or 'exit' to quit): ").capitalize()

        if user_response == 'Exit':
            break

        country_data = fetch_country_info(user_response)

        if country_data:
            capital = country_data['capital'][0]
            population = country_data['population']

            print(f"Country: {user_response}")
            print(f"Capital: {capital}")
            print(f"Population: {population}")

            countries_data.append({
                'Country': user_response,
                'Capital': capital,
                'Population': population,
            })
        else:
            print(f"Could not fetch information for {user_response}")

    if countries_data != None:
        df = pd.DataFrame(countries_data)

        df.to_json('country_info.json', orient='records')

if __name__ == "__main__":
    main()