// Generated by gencpp from file netft_utils/GetDoubleResponse.msg
// DO NOT EDIT!


#ifndef NETFT_UTILS_MESSAGE_GETDOUBLERESPONSE_H
#define NETFT_UTILS_MESSAGE_GETDOUBLERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace netft_utils
{
template <class ContainerAllocator>
struct GetDoubleResponse_
{
  typedef GetDoubleResponse_<ContainerAllocator> Type;

  GetDoubleResponse_()
    : weight(0.0)  {
    }
  GetDoubleResponse_(const ContainerAllocator& _alloc)
    : weight(0.0)  {
  (void)_alloc;
    }



   typedef double _weight_type;
  _weight_type weight;




  typedef boost::shared_ptr< ::netft_utils::GetDoubleResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::netft_utils::GetDoubleResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetDoubleResponse_

typedef ::netft_utils::GetDoubleResponse_<std::allocator<void> > GetDoubleResponse;

typedef boost::shared_ptr< ::netft_utils::GetDoubleResponse > GetDoubleResponsePtr;
typedef boost::shared_ptr< ::netft_utils::GetDoubleResponse const> GetDoubleResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::netft_utils::GetDoubleResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace netft_utils

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'netft_utils': ['/home/baxter/mn/src/netft_utils/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::netft_utils::GetDoubleResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::netft_utils::GetDoubleResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::netft_utils::GetDoubleResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "41998f6691705e7d3db1ca4195275ab0";
  }

  static const char* value(const ::netft_utils::GetDoubleResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x41998f6691705e7dULL;
  static const uint64_t static_value2 = 0x3db1ca4195275ab0ULL;
};

template<class ContainerAllocator>
struct DataType< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "netft_utils/GetDoubleResponse";
  }

  static const char* value(const ::netft_utils::GetDoubleResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 weight\n\
\n\
";
  }

  static const char* value(const ::netft_utils::GetDoubleResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.weight);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetDoubleResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::netft_utils::GetDoubleResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::netft_utils::GetDoubleResponse_<ContainerAllocator>& v)
  {
    s << indent << "weight: ";
    Printer<double>::stream(s, indent + "  ", v.weight);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NETFT_UTILS_MESSAGE_GETDOUBLERESPONSE_H
