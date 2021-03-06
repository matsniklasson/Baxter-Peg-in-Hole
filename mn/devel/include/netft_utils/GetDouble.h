// Generated by gencpp from file netft_utils/GetDouble.msg
// DO NOT EDIT!


#ifndef NETFT_UTILS_MESSAGE_GETDOUBLE_H
#define NETFT_UTILS_MESSAGE_GETDOUBLE_H

#include <ros/service_traits.h>


#include <netft_utils/GetDoubleRequest.h>
#include <netft_utils/GetDoubleResponse.h>


namespace netft_utils
{

struct GetDouble
{

typedef GetDoubleRequest Request;
typedef GetDoubleResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetDouble
} // namespace netft_utils


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::netft_utils::GetDouble > {
  static const char* value()
  {
    return "43623635c0100a1d66762de2a2c1a2da";
  }

  static const char* value(const ::netft_utils::GetDouble&) { return value(); }
};

template<>
struct DataType< ::netft_utils::GetDouble > {
  static const char* value()
  {
    return "netft_utils/GetDouble";
  }

  static const char* value(const ::netft_utils::GetDouble&) { return value(); }
};


// service_traits::MD5Sum< ::netft_utils::GetDoubleRequest> should match 
// service_traits::MD5Sum< ::netft_utils::GetDouble > 
template<>
struct MD5Sum< ::netft_utils::GetDoubleRequest>
{
  static const char* value()
  {
    return MD5Sum< ::netft_utils::GetDouble >::value();
  }
  static const char* value(const ::netft_utils::GetDoubleRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::netft_utils::GetDoubleRequest> should match 
// service_traits::DataType< ::netft_utils::GetDouble > 
template<>
struct DataType< ::netft_utils::GetDoubleRequest>
{
  static const char* value()
  {
    return DataType< ::netft_utils::GetDouble >::value();
  }
  static const char* value(const ::netft_utils::GetDoubleRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::netft_utils::GetDoubleResponse> should match 
// service_traits::MD5Sum< ::netft_utils::GetDouble > 
template<>
struct MD5Sum< ::netft_utils::GetDoubleResponse>
{
  static const char* value()
  {
    return MD5Sum< ::netft_utils::GetDouble >::value();
  }
  static const char* value(const ::netft_utils::GetDoubleResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::netft_utils::GetDoubleResponse> should match 
// service_traits::DataType< ::netft_utils::GetDouble > 
template<>
struct DataType< ::netft_utils::GetDoubleResponse>
{
  static const char* value()
  {
    return DataType< ::netft_utils::GetDouble >::value();
  }
  static const char* value(const ::netft_utils::GetDoubleResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // NETFT_UTILS_MESSAGE_GETDOUBLE_H
