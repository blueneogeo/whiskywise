# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/msgpack/all/msgpack.rbi
#
# msgpack-1.3.3

module MessagePack
  def dump(v, *rest); end
  def load(src, param = nil); end
  def pack(v, *rest); end
  def self.dump(v, *rest); end
  def self.load(src, param = nil); end
  def self.pack(v, *rest); end
  def self.unpack(src, param = nil); end
  def unpack(src, param = nil); end
end
class MessagePack::Buffer
  def <<(arg0); end
  def clear; end
  def close; end
  def empty?; end
  def flush; end
  def initialize(*arg0); end
  def io; end
  def read(*arg0); end
  def read_all(*arg0); end
  def size; end
  def skip(arg0); end
  def skip_all(arg0); end
  def to_a; end
  def to_s; end
  def to_str; end
  def write(arg0); end
  def write_to(arg0); end
end
class MessagePack::Packer
  def buffer; end
  def clear; end
  def compatibility_mode?; end
  def empty?; end
  def flush; end
  def full_pack; end
  def initialize(*arg0); end
  def pack(arg0); end
  def register_type(*arg0); end
  def registered_types; end
  def registered_types_internal; end
  def size; end
  def to_a; end
  def to_s; end
  def to_str; end
  def type_registered?(klass_or_type); end
  def write(arg0); end
  def write_array(arg0); end
  def write_array_header(arg0); end
  def write_bin(arg0); end
  def write_bin_header(arg0); end
  def write_ext(arg0, arg1); end
  def write_extension(arg0); end
  def write_false; end
  def write_float(arg0); end
  def write_float32(arg0); end
  def write_hash(arg0); end
  def write_int(arg0); end
  def write_map_header(arg0); end
  def write_nil; end
  def write_string(arg0); end
  def write_symbol(arg0); end
  def write_to(arg0); end
  def write_true; end
end
class MessagePack::Unpacker
  def allow_unknown_ext?; end
  def buffer; end
  def each; end
  def feed(arg0); end
  def feed_each(arg0); end
  def feed_reference(arg0); end
  def full_unpack; end
  def initialize(*arg0); end
  def read; end
  def read_array_header; end
  def read_map_header; end
  def register_type(*arg0); end
  def registered_types; end
  def registered_types_internal; end
  def reset; end
  def skip; end
  def skip_nil; end
  def symbolize_keys?; end
  def type_registered?(klass_or_type); end
  def unpack; end
end
class MessagePack::Factory
  def dump(v, *rest); end
  def initialize(*arg0); end
  def load(src, param = nil); end
  def pack(v, *rest); end
  def packer(*arg0); end
  def register_type(*arg0); end
  def registered_types(selector = nil); end
  def registered_types_internal; end
  def type_registered?(klass_or_type, selector = nil); end
  def unpack(src, param = nil); end
  def unpacker(*arg0); end
end
class MessagePack::ExtensionValue < Struct
  def payload; end
  def payload=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def to_msgpack_with_packer(packer); end
  def type; end
  def type=(_); end
  include MessagePack::CoreExt
end
class Symbol
  def self.all_symbols; end
  def to_msgpack_ext; end
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
module MessagePack::CoreExt
  def to_msgpack(packer_or_io = nil); end
end
class NilClass
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class TrueClass
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class FalseClass
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class Float < Numeric
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class String
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class Array
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class Hash
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class Integer < Numeric
  def to_msgpack_with_packer(packer); end
  include MessagePack::CoreExt
end
class MessagePack::Timestamp
  def ==(other); end
  def initialize(sec, nsec); end
  def nsec; end
  def sec; end
  def self.from_msgpack_ext(data); end
  def self.to_msgpack_ext(sec, nsec); end
  def to_msgpack_ext; end
end
module MessagePack::Time
end
