global class ParkLocator {

    global static String[] country(String countryName){
        ParkService.ParksImplPort ps=new ParkService.ParksImplPort();
        return ps.byCountry(countryName);
    }
}