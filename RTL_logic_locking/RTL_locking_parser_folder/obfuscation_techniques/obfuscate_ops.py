# -------------------------------------------------------------------------------
# Copyright 2018-2020, Christian Pilato <christian.pilato@polimi.it>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -------------------------------------------------------------------------------
import pyverilog.vparser.ast as vast


def apply(item, cfg, res,apply_operation_obf,list_working_key,user_key):
    print("apply op")

    if apply_operation_obf==0:
        if not cfg.obfuscate_ops or not cfg.obfuscate_region:
            return item
        if not cfg.unfold_key and ((len(cfg.working_key)+1) > len(cfg.input_key)):
            return item
        pos = (len(cfg.working_key)) % len(cfg.input_key)
        key = cfg.input_key[pos]
        if type(item) is vast.Plus:
            alternative = vast.Minus(item.left, item.right)
        elif type(item) is vast.Minus:
            alternative = vast.Plus(item.left, item.right)
        elif type(item) is vast.Or:
            alternative = vast.And(item.left, item.right)
        elif type(item) is vast.And:
            alternative = vast.Or(item.left, item.right)
        elif type(item) is vast.Times:
            alternative = vast.Plus(item.left, item.right)
        elif type(item) is vast.Sll:
            alternative = vast.Srl(item.left, item.right)
        elif type(item) is vast.Xor:
            alternative = vast.Or(item.left, item.right)
        elif type(item) is vast.GreaterThan:
            alternative = vast.GreaterThan(item.left , item.right)
        elif type(item) is vast.Eq:
            alternative = vast.GreaterThan(item.left , item.right)
        elif type(item) is vast.LessThan:
            alternative = vast.GreaterThan(item.left , item.right)
        elif type(item) is vast.Eql:
            alternative = vast.GreaterThan(item.left,item.right)
        elif type(item) is vast.Srl:
            alternative = vast.Sll(item.left,item.right)
        elif type(item) is vast.NotEq:
            alternative = vast.Eq(item.left,item.right)





        else:
            raise Exception("Type: \"" + str(type(item)) + "\" is not supported yet for op obfuscation")
        if key == '1':
            if user_key == 1:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                index=res.top_output.initial_working_key + res.top_output.key_bits
                value=list_working_key[index]
                string_temp2="1'b"+str(value)
                item3=vast.IntConst(string_temp2)
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, item, alternative)
            else:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                item3=vast.Pointer(vast.Identifier('working_key'), vast.IntConst(str(res.top_output.initial_working_key + res.top_output.key_bits)))
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, item, alternative)
        else:
            if user_key == 1:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                index=res.top_output.initial_working_key + res.top_output.key_bits
                value=list_working_key[index]
                string_temp2="1'b"+str(value)
                item3=vast.IntConst(string_temp2)
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, alternative, item)
            else:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                item3=vast.Pointer(vast.Identifier('working_key'), vast.IntConst(str(res.top_output.initial_working_key + res.top_output.key_bits)))
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, alternative, item)
        cfg.working_key += key
        res.top_output.module_key += key
        res.top_output.key_bits += 1
        res.num_ops += 1
    print("item end")
    return item
