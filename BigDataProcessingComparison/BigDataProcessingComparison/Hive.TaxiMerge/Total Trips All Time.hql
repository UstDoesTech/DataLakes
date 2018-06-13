SET sample_data_path = /RAW/Taxis;


@fhv2015 =
    EXTRACT [Dispatching_base_num] string,
            [Pickup_date] DateTime,
            [locationID] string
    FROM "/RAW/Taxis/2015/fhv_{*}.csv" 
    USING Extractors.Csv(silent:true,skipFirstNRows:1);

@fhv2016 =
    EXTRACT [Dispatching_base_num] string,
            [Pickup_date] DateTime,
            [locationID] string
    FROM "/RAW/Taxis/2016/fhv_{*}.csv" 
    USING Extractors.Csv(silent:true,skipFirstNRows:1);

@fhv2017 =
    EXTRACT [Dispatching_base_num] string,
            [Pickup_DateTime] DateTime?,
            [DropOff_datetime] string,
            [PUlocationID] int?,
            [DOlocationID] string
    FROM "/RAW/Taxis/2017/fhv_{*}.csv" 
    USING Extractors.Csv(silent:true,skipFirstNRows:1);

@yellow2009 =
    EXTRACT [vendor_name] string,
            [Trip_Pickup_DateTime] DateTime,
            [Trip_Dropoff_DateTime] DateTime,
            [Passenger_Count] int,
            [Trip_Distance] double,
            [Start_Lon] double,
            [Start_Lat] double,
            [Rate_Code] string,
            [store_and_forward] string,
            [End_Lon] double,
            [End_Lat] double,
            [Payment_Type] string,
            [Fare_Amt] double,
            [surcharge] int,
            [mta_tax] string,
            [Tip_Amt] int,
            [Tolls_Amt] int,
            [Total_Amt] double
    FROM "/RAW/Taxis/2009/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2010 =
    EXTRACT [vendor_id] string,
            [pickup_datetime] DateTime,
            [dropoff_datetime] DateTime,
            [passenger_count] int,
            [trip_distance] double,
            [pickup_longitude] double,
            [pickup_latitude] double,
            [rate_code] int,
            [store_and_fwd_flag] string,
            [dropoff_longitude] double,
            [dropoff_latitude] double,
            [payment_type] string,
            [fare_amount] double,
            [surcharge] int,
            [mta_tax] double,
            [tip_amount] int,
            [tolls_amount] int,
            [total_amount] double
    FROM "/RAW/Taxis/2010/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2011 =
    EXTRACT [vendor_id] string,
            [pickup_datetime] DateTime,
            [dropoff_datetime] DateTime,
            [passenger_count] int,
            [trip_distance] double,
            [pickup_longitude] double,
            [pickup_latitude] double,
            [rate_code] int,
            [store_and_fwd_flag] string,
            [dropoff_longitude] double,
            [dropoff_latitude] double,
            [payment_type] string,
            [fare_amount] double,
            [surcharge] int,
            [mta_tax] double,
            [tip_amount] int,
            [tolls_amount] int,
            [total_amount] double
    FROM "/RAW/Taxis/2011/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2012 =
    EXTRACT [vendor_id] string,
            [pickup_datetime] DateTime,
            [dropoff_datetime] DateTime,
            [passenger_count] int,
            [trip_distance] double,
            [pickup_longitude] double,
            [pickup_latitude] double,
            [rate_code] int,
            [store_and_fwd_flag] string,
            [dropoff_longitude] double,
            [dropoff_latitude] double,
            [payment_type] string,
            [fare_amount] double,
            [surcharge] int,
            [mta_tax] double,
            [tip_amount] int,
            [tolls_amount] int,
            [total_amount] int
    FROM "/RAW/Taxis/2012/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2013 =
    EXTRACT [vendor_id] string,
            [pickup_datetime] DateTime,
            [dropoff_datetime] DateTime,
            [passenger_count] int,
            [trip_distance] double,
            [pickup_longitude] double,
            [pickup_latitude] double,
            [rate_code] int,
            [store_and_fwd_flag] string,
            [dropoff_longitude] double,
            [dropoff_latitude] double,
            [payment_type] string,
            [fare_amount] double,
            [surcharge] int,
            [mta_tax] double,
            [tip_amount] int,
            [tolls_amount] int,
            [total_amount] int
    FROM "/RAW/Taxis/2013/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2014 =
    EXTRACT [vendor_id] string,
            [ pickup_datetime] DateTime,
            [ dropoff_datetime] DateTime,
            [ passenger_count] int,
            [ trip_distance] double,
            [ pickup_longitude] double,
            [ pickup_latitude] double,
            [ rate_code] int,
            [ store_and_fwd_flag] string,
            [ dropoff_longitude] double,
            [ dropoff_latitude] double,
            [ payment_type] string,
            [ fare_amount] int,
            [ surcharge] int,
            [ mta_tax] double,
            [ tip_amount] int,
            [ tolls_amount] int,
            [ total_amount] double
    FROM "/RAW/Taxis/2014/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2015 =
    EXTRACT [VendorID] int,
            [tpep_pickup_datetime] DateTime,
            [tpep_dropoff_datetime] DateTime,
            [passenger_count] int,
            [trip_distance] double,
            [pickup_longitude] double,
            [pickup_latitude] double,
            [RateCodeID] int,
            [store_and_fwd_flag] string,
            [dropoff_longitude] double,
            [dropoff_latitude] double,
            [payment_type] int,
            [fare_amount] int,
            [extra] int,
            [mta_tax] double,
            [tip_amount] double,
            [tolls_amount] int,
            [improvement_surcharge] double,
            [total_amount] double
    FROM "/RAW/Taxis/2015/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2016 =
    EXTRACT [VendorID] int,
            [tpep_pickup_datetime] DateTime,
            [tpep_dropoff_datetime] DateTime,
            [passenger_count] int,
            [trip_distance] double,
            [pickup_longitude] double,
            [pickup_latitude] double,
            [RatecodeID] int,
            [store_and_fwd_flag] string,
            [dropoff_longitude] double,
            [dropoff_latitude] double,
            [payment_type] int,
            [fare_amount] double,
            [extra] double,
            [mta_tax] double,
            [tip_amount] double,
            [tolls_amount] int,
            [improvement_surcharge] double,
            [total_amount] double
    FROM "/RAW/Taxis/2016/yellow_{*}.csv" 
    USING Extractors.Csv(silent:true, skipFirstNRows:1);

@yellow2017 =
    EXTRACT [VendorID] int?,
            [tpep_pickup_datetime] DateTime,
            [tpep_dropoff_datetime] DateTime,
            [passenger_count] int?,
            [trip_distance] double?,
            [RatecodeID] int?,
            [store_and_fwd_flag] string,
            [PULocationID] int?,
            [DOLocationID] int?,
            [payment_type] int?,
            [fare_amount] int?,
            [extra] double?,
            [mta_tax] double?,
            [tip_amount] int?,
            [tolls_amount] int?,
            [improvement_surcharge] double?,
            [total_amount] double?	
	FROM "/RAW/Taxis/2017/yellow_{*}.csv"
	USING Extractors.Csv(silent:true, skipFirstNRows: 1);

@green2013 =
    EXTRACT [VendorID] int,
            [lpep_pickup_datetime] DateTime,
            [Lpep_dropoff_datetime] DateTime,
            [Store_and_fwd_flag] string,
            [RateCodeID] int,
            [Pickup_longitude] int,
            [Pickup_latitude] int,
            [Dropoff_longitude] int,
            [Dropoff_latitude] int,
            [Passenger_count] int,
            [Trip_distance] double,
            [Fare_amount] double,
            [Extra] int,
            [MTA_tax] int,
            [Tip_amount] int,
            [Tolls_amount] int,
            [Ehail_fee] string,
            [Total_amount] double,
            [Payment_type] int,
            [Trip_type ] string
    FROM "/RAW/Taxis/2013/green_{*}.csv"
	USING Extractors.Csv(silent:true, skipFirstNRows: 1);

@green2014 =
    EXTRACT [VendorID] int,
            [lpep_pickup_datetime] DateTime,
            [Lpep_dropoff_datetime] DateTime,
            [Store_and_fwd_flag] string,
            [RateCodeID] int,
            [Pickup_longitude] double,
            [Pickup_latitude] double,
            [Dropoff_longitude] double,
            [Dropoff_latitude] double,
            [Passenger_count] int,
            [Trip_distance] double,
            [Fare_amount] int,
            [Extra] double,
            [MTA_tax] double,
            [Tip_amount] int,
            [Tolls_amount] int,
            [Ehail_fee] string,
            [Total_amount] int,
            [Payment_type] int,
            [Trip_type ] string
    FROM "/RAW/Taxis/2014/green_{*}.csv"
	USING Extractors.Csv(silent:true, skipFirstNRows: 1);

@green2015 =
    EXTRACT [VendorID] int,
            [lpep_pickup_datetime] DateTime,
            [Lpep_dropoff_datetime] DateTime,
            [Store_and_fwd_flag] string,
            [RateCodeID] int,
            [Pickup_longitude] double,
            [Pickup_latitude] double,
            [Dropoff_longitude] double,
            [Dropoff_latitude] double,
            [Passenger_count] int,
            [Trip_distance] double,
            [Fare_amount] double,
            [Extra] double,
            [MTA_tax] double,
            [Tip_amount] int,
            [Tolls_amount] int,
            [Ehail_fee] string,
            [improvement_surcharge] double,
            [Total_amount] double,
            [Payment_type] int,
            [Trip_type ] int
    FROM "/RAW/Taxis/2015/green_{*}.csv"
	USING Extractors.Csv(silent:true, skipFirstNRows: 1);

@green2016 =
    EXTRACT [VendorID] int,
            [lpep_pickup_datetime] DateTime,
            [Lpep_dropoff_datetime] DateTime,
            [Store_and_fwd_flag] string,
            [RateCodeID] int,
            [Pickup_longitude] double,
            [Pickup_latitude] double,
            [Dropoff_longitude] double,
            [Dropoff_latitude] double,
            [Passenger_count] int,
            [Trip_distance] double,
            [Fare_amount] int,
            [Extra] double,
            [MTA_tax] double,
            [Tip_amount] int,
            [Tolls_amount] int,
            [Ehail_fee] string,
            [improvement_surcharge] double,
            [Total_amount] double,
            [Payment_type] int,
            [Trip_type ] int
    FROM "/RAW/Taxis/2016/green_{*}.csv"
	USING Extractors.Csv(silent:true, skipFirstNRows: 1);

@green2017 =
    EXTRACT [VendorID] int?,
            [lpep_pickup_datetime] DateTime?,
            [lpep_dropoff_datetime] DateTime?,
            [store_and_fwd_flag] string,
            [RatecodeID] int?,
            [PULocationID] int?,
            [DOLocationID] int?,
            [passenger_count] int?,
            [trip_distance] double?,
            [fare_amount] double?,
            [extra] double?,
            [mta_tax] double?,
            [tip_amount] int?,
            [tolls_amount] int?,
            [ehail_fee] string,
            [improvement_surcharge] double?,
            [total_amount] double?,
            [payment_type] int?,
            [trip_type] int?
	    FROM "/RAW/Taxis/2017/green_{*}.csv"
	    USING Extractors.Csv(silent:true, skipFirstNRows: 1);


@result =
    SELECT COUNT( * ) AS RowCount
    FROM @fhv2015

    UNION ALL
    
    SELECT COUNT( * ) AS RowCount
    FROM @fhv2016

    UNION ALL
    
    SELECT COUNT( * ) AS RowCount
    FROM @fhv2017

    UNION ALL

    SELECT COUNT( * ) AS RowCount
    FROM @yellow2009
         
    UNION ALL 
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2010
         
    UNION ALL 
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2011
         
    UNION ALL 
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2012
         
    UNION ALL
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2013
         
    UNION ALL
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2014
         
    UNION ALL 
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2015
         
    UNION ALL 
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2016
         
    UNION ALL 
    
    SELECT COUNT( * ) AS RowCount
    FROM @yellow2017
         
    UNION ALL 
    
    SELECT COUNT(*) AS RowCount
    FROM @green2013
         
    UNION ALL 
    
    SELECT COUNT(*) AS RowCount
    FROM @green2014
         
    UNION ALL 
    
    SELECT COUNT(*) AS RowCount
    FROM @green2015
         
    UNION ALL 
    
    SELECT COUNT(*) AS RowCount
    FROM @green2016
         
    UNION ALL 
    
    SELECT COUNT(*) AS RowCount
    FROM @green2017;

@result =
    SELECT SUM(RowCount) AS TotalTrips
    FROM @result;

OUTPUT @result
TO "/output/TotalTrips_2009_2017_USQL.Csv"
USING Outputters.Csv();
    


