// Generated by gencpp from file netft_utils/SetFilter.msg
// DO NOT EDIT!


#ifndef NETFT_UTILS_MESSAGE_SETFILTER_H
#define NETFT_UTILS_MESSAGE_SETFILTER_H

#include <ros/service_traits.h>


#include <netft_utils/SetFilterRequest.h>
#include <netft_utils/SetFilterResponse.h>


namespace netft_utils
{

struct SetFilter
{

typedef SetFilterRequest Request;
typedef SetFilterResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetFilter
} // namespace netft_utils


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::netft_utils::SetFilter > {
  static const char* value()
  {
    return "63edfd1498649d874534855980e23bf0";
  }

  static const char* value(const ::netft_utils::SetFilter&) { return value(); }
};

template<>
struct DataType< ::netft_utils::SetFilter > {
  static const char* value()
  {
    return "netft_utils/SetFilter";
  }

  static const char* value(const ::netft_utils::SetFilter&) { return value(); }
};


// service_traits::MD5Sum< ::netft_utils::SetFilterRequest> should match 
// service_traits::MD5Sum< ::netft_utils::SetFilter > 
template<>
struct MD5Sum< ::netft_utils::SetFilterRequest>
{
  static const char* value()
  {
    return MD5Sum< ::netft_utils::SetFilter >::value();
  }
  static const char* value(const ::netft_utils::SetFilterRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::netft_utils::SetFilterRequest> should match 
// service_traits::DataType< ::netft_utils::SetFilter > 
template<>
struct DataType< ::netft_utils::SetFilterRequest>
{
  static const char* value()
  {
    return DataType< ::netft_utils::SetFilter >::value();
  }
  static const char* value(const ::netft_utils::SetFilterRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::netft_utils::SetFilterResponse> should match 
// service_traits::MD5Sum< ::netft_utils::SetFilter > 
template<>
struct MD5Sum< ::netft_utils::SetFilterResponse>
{
  static const char* value()
  {
    return MD5Sum< ::netft_utils::SetFilter >::value();
  }
  static const char* value(const ::netft_utils::SetFilterResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::netft_utils::SetFilterResponse> should match 
// service_traits::DataType< ::netft_utils::SetFilter > 
template<>
struct DataType< ::netft_utils::SetFilterResponse>
{
  static const char* value()
  {
    return DataType< ::netft_utils::SetFilter >::value();
  }
  static const char* value(const ::netft_utils::SetFilterResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // NETFT_UTILS_MESSAGE_SETFILTER_H
