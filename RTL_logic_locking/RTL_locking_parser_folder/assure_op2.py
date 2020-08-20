from __future__ import absolute_import
from __future__ import print_function

import shutil
import os
import copy
import time
from time import clock
import random

import sys
sys.path.append(os.path.join(os.path.abspath(os.path.dirname(__file__)), '.'))

from optparse import OptionParser

import obfuscation_data
import obfuscation_techniques
import output_generation

import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import VerilogCodeParser
#part select one temp_one[0:0]
count=0
total_constant=0
total_operations=0
total_branch=0
total_working_key=0

def resolve(input_string):
	string1=""
	for i in input_string:
		if i!="'":
			string1=string1+i
		else:
			break
	print(string1)
	return int(string1)

def binaryToDecimal(n):
    return int(n,2)
'''
def generate(msb,lsb):
    i=0
    string_generate=""
    while i<int(lsb):
        string_generate=string_generate+"0"
        i=i+1
    while i<=int(msb):
        string_generate="1"+string_generate
        i=i+1

    value=binaryToDecimal(string_generate)
    return str(value)

def part_select_resolve(msb,lsb):
	msb=int(msb)
	lsb=int(lsb)
	print(msb)
	print(lsb)
	msb=msb-lsb
	lsb=0
	i=0
	string_temp=""
	while i<lsb:
		string_temp=string_temp+"0"
		i=i+1
	while i<=(msb-lsb):
		string_temp="1"+string_temp
		i=i+1

	print("string temp")
	print(string_temp)
	value=int(string_temp,2)
	string_temp=str(msb-lsb+1)+"'d"+str(value)
	item=vast.IntConst(string_temp)
	return item
'''
def part_select_two(msb,lsb,width,side):
	print("part select two")
	i=0
	msb=int(msb)
	lsb=int(lsb)
	width=int(width)
	string_temp=""
	while i<lsb:
		string_temp=string_temp+"1"
		i=i+1
	while i<=msb:
		string_temp="0"+string_temp
		i=i+1
	while i<=width:
		string_temp="1"+string_temp
		i=i+1
	if lsb==0 and side=="left":
		value=binaryToDecimal(string_temp)
		item=create_intconst(msb-lsb+1,value)
		return item
	if lsb!=0 and side=="left":
		value=binaryToDecimal(string_temp)
		item=create_intconst(width,value)
		return item
	if lsb!=0 and side=="right":
		string_temp1=""
		i=0
		while i<len(string_temp):
			if string_temp[i]=="0":
				string_temp1=string_temp1+"1"			
			else:
				string_temp1=string_temp1+"0"
			i=i+1
		value=binaryToDecimal(string_temp1)
		item=create_intconst(width,value)
		return item

def part_select_one(msb,lsb):
	i=0
	msb=int(msb)
	lsb=int(lsb)
	string_temp=""
	while i<=msb:
		string_temp="1"+string_temp
		i=i+1

	value=binaryToDecimal(string_temp)
	item=create_intconst(msb-lsb+1,value)
	print("item")
	print(type(item))
	return item

def extract_value_and_size(str):
	i=0
	string_value=""
	string_size=""
	flag=0
	while i<len(str):
		if str[i]=="d":
			flag=1
		else:
			if str[i]!="'" and flag==0:
				string_size=string_size+str[i]
			elif str[i]!="'":
				string_value=string_value+str[i]			
		i=i+1

	size=int(string_size)
	value=int(string_value)
	return int(size),int(value)
'''			
def part_select_resolve_always(msb,lsb):
	i=0
	string_temp=""
	if lsb!=0:
		while i<lsb:
			string_temp=string_temp+"0"
			i=i+1
		while i<=msb:
			string_temp="1"+string_temp
			i=i+1

	value=int(string_temp,2)
	string_temp=str(msb+1)+"'d"+str(value)
	item=vast.IntConst(string_temp)
	return item
'''
def create_new_variable(name):
	global count
	name=name+"_temp_"+str(count)
	count=count+1
	name=vast.Identifier(name)
	return name

def find_width(input_module,name):
	for item_dec in  input_module.items:
		if type(item_dec) is vast.Decl:
			if item_dec.list[0].name==name:
				#print(item_dec.list[0].name)
				#print("in decl")
				width=int(item_dec.list[0].width.msb.value)
				return width

def create_intconst(data_width,value):
	item_x=str(data_width)+"'d"+str(value)
	final_item=vast.IntConst(item_x)
	return final_item

def create(item_x,item_y):
	item_x=vast.Lvalue(item_x)
	item_y=vast.Rvalue(item_y)
	return item_x,item_y

def create_srl(item_x,item_y):
	item_x,item_y=create(item_x,item_y)
	final_item=vast.Srl(item_x,item_y)
	return final_item

def create_sll(item_x,item_y):
	item_x,item_y=create(item_x,item_y)
	final_item=vast.Sll(item_x,item_y)
	return final_item

def create_and(item_x,item_y):
	item_x,item_y=create(item_x,item_y)
	final_item=vast.And(item_x,item_y)
	return final_item


def create_or(item_x,item_y):
	item_x,item_y=create(item_x,item_y)
	final_item=vast.Or(item_x,item_y)
	return final_item

def create_assign(item_x,item_y,res):
	item_x,item_y=create(item_x,item_y)
	final_item1=vast.Assign(item_x,item_y)
	final_item2=(vast.Assign(item_x,item_y),)
	res.top_output.items+=final_item2
	return final_item1

def concate_const_formation(shift_string):
	shift_string=shift_string
	shift_value1=""
	shift_value2=""
	i=0
	flag=0
	while i<len(shift_string):
		if shift_string[i]=="d":
			flag=1
		else:
			if flag==1:
				shift_value1=shift_value1+shift_string[i]
			elif flag==0 and shift_string[i]!="'":
				shift_value2=shift_value2+shift_string[i]
		i=i+1

	if int(shift_value1)==0:
		return(int(shift_value2))
	


def analyze_item(item, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key):
    #print(item)
    #print("analyze_item")
    if isinstance(item, vast.Pragma):
        if item.entry.name == "obfuscation_off":
            cfg.obfuscate_region = False
        elif item.entry.name == "obfuscation_on":
            cfg.obfuscate_region = True
        return item

    if not cfg.obfuscate_region:
        return item

    if isinstance(item, vast.Identifier):
        #print("vi")
        return item
    elif isinstance(item, vast.IntConst):
        #print("ic")
        #print("analyze int consta")
        return obfuscation_techniques.obfuscate_const.apply(item, cfg, res, sig_size,list_working_key,user_key)
    elif isinstance(item, vast.FloatConst):
        #print("fc")
        return item
    elif isinstance(item, vast.StringConst):
        #print("sc")
        return item
    elif isinstance(item, vast.Concat):
        #print("cc")
        new_list = ()
        for inst in item.list:
            inst = analyze_item(inst, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            new_list += (inst,)
        item.list = new_list
        return item
    elif isinstance(item, vast.Repeat):

        ##print("repeat")
        item.value = analyze_item(item.value, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.Partselect):
        #print("ps")

        return item
    elif isinstance(item, vast.Pointer):
        #print("po")
        return item
    elif isinstance(item, vast.Lvalue):

        #print("lv")
        return item
    elif isinstance(item, vast.Rvalue):
        #print("rv")
        item.var = analyze_item(item.var, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.UnaryOperator):
        #print("uo")
        item.right = analyze_item(item.right, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Cond):
        #apply_operation_obf=1
        #print("in condition")
        #print(item.cond)
        item.cond = analyze_item(item.cond, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.cond)
        #print("true value")
        #print(item.true_value)
        if type(item.true_value) is vast.IntConst:
        	sig_size=resolve(item.true_value.value)
        item.true_value = analyze_item(item.true_value, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.true_value)
        #print("false value")
        #print(item.false_value)
        if type(item.false_value) is vast.IntConst:
        	sig_size=resolve(item.false_value.value)
        item.false_value = analyze_item(item.false_value, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.false_value)
        #print(item.cond)
        item.cond, to_switch = obfuscation_techniques.obfuscate_branch.apply(item.cond, True, cfg, res,list_working_key,user_key)
        #print(item.cond)
        #print(to_switch)

        if to_switch:
            tmp = item.false_value
            item.false_value = item.true_value
            item.true_value = tmp
    elif isinstance(item, vast.Operator):
        #print("operator")
        #print(type(item))
        item.left = analyze_item(item.left, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print("left item")
        #print(item.left)
        item.right = analyze_item(item.right, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print("item right")
        #print(item.right)
        #print("in operator again")
        #print(item)
        return obfuscation_techniques.obfuscate_ops.apply(item, cfg, res,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Assign):
        #print("here in assign")

        #print(item.left)
        #print(type(item.right.var.cond.left.args[0]))
        #print(type(item.right.var))
        #nprint(item.right.var)
        if type(item.right.var) is vast.Cond:
        	#print("in assign condition")
        	#print(type(item.right.var.cond))
        	if type(item.right.var.cond) is vast.GreaterThan:
        		#print("in greater than")
        		if type(item.right.var.cond.left) is vast.Identifier:
                                     #print(type(item.right.var.cond.right))
                                     left_size=resolve(item.right.var.cond.right.value)

        		elif type(item.right.var.cond.left.args[0]) is vast.IntConst:
	       			#print(item.right.var.cond.left.args[0])
        			left_size=resolve(item.right.var.cond.left.args[0].value)

        		elif type(item.right.var.cond.right.args[0]) is vast.IntConst:
        			#print(type(item.right.var.cond.right.args[0]))
        			#print("integer constant")
        			#print(item.right.var.cond.right.args[0].value)
        			#print(item.right.var.cond.right.args[0])
        			left_size=resolve(item.right.var.cond.right.args[0].value)
        			#print(left_size)

        		else:
        			left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)


        	elif type(item.right.var.cond) is vast.LessThan:
        		left_size=0

	        elif type(item.right.var.cond) is vast.Eql:
	            #print("in eql")
	            if type(item.right.var.cond.left) is vast.Partselect:
	                #print("here we are")
	                left_size=resolve(item.right.var.cond.right.value)

	        elif type(item.right.var.cond) is vast.Eq:
	            if type(item.right.var.cond.right) is vast.IntConst:
	                left_size=resolve(item.right.var.cond.right.value)
	            elif type(item.right.var.cond.left) is vast.IntConst:
	            	left_size=resolve(item.right.var.cond.right.value)
	            else:
	            	left_size=obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)


        	else:
        		left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        
        elif type(item.right.var) is vast.Concat:
            return item
            
        else:
        #if item.right.var.cond=(item.right.var.cond.right.args[0].value))
        	left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        #print("left_size")
        #print(left_size)
        #print("item.right.var")
        #print(item.right.var)
        item.right.var = analyze_item(item.right.var, cfg, res, left_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.right.var)

    elif isinstance(item, vast.Always):
        #print("alays")
        apply_operation_obf=1
        item.statement = analyze_item(item.statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.BlockingSubstitution) or isinstance(item, vast.NonblockingSubstitution):
        if type(item.left.var) is vast.Partselect:
        	return item
        elif type(item.left.var) is vast.Pointer:
            return item
        #print("non block part")
        left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        item.left = analyze_item(item.left, cfg, res, left_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        item.right = analyze_item(item.right, cfg, res, left_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.IfStatement):
        if not obfuscation_techniques.obfuscation_analysis.is_reset(item.cond):
            item.cond = analyze_item(item.cond, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        value = True
        to_switch = False
        if not item.false_statement or isinstance(item.false_statement, vast.IfStatement):
            value = False
        if obfuscation_techniques.obfuscation_analysis.is_reset(item.cond):
            cfg.obfuscate_region = False
            item.true_statement = analyze_item(item.true_statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            cfg.obfuscate_region = True
        else:
            item.true_statement = analyze_item(item.true_statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            if item.false_statement:
                item.false_statement = analyze_item(item.false_statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
                item.cond, to_switch = obfuscation_techniques.obfuscate_branch.apply(item.cond, value, cfg, res,list_working_key,user_key)
            if to_switch and value and item.false_statement:
                tmp = item.false_statement
                item.false_statement = item.true_statement
                item.true_statement = tmp
        return item
    elif isinstance(item, vast.ForStatement):
        return item
    elif isinstance(item, vast.WhileStatement):
        return item
    elif isinstance(item, vast.CaseStatement):
        for case in item.caselist:
            case = analyze_item(case, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Case):
        item.statement = analyze_item(item.statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Block):
        for st in item.statements:
            st = analyze_item(st, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.Initial):
        return item
    elif isinstance(item, vast.InstanceList):
        for inst in item.instances:
            for port in inst.portlist:
                port.argname = analyze_item(port.argname, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.Function):
        return item
    elif isinstance(item, vast.FunctionCall):
        return item
    elif isinstance(item, vast.SystemCall):
        #print("system call")
        for inst in item.args:
            inst = analyze_item(inst, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            #print("inst")
            return(inst)
        #return item
    elif isinstance(item, vast.GenerateStatement):
        return item
    else:
        #raise Exception("Type: \"" + str(type(item)) + "\" is not supported yet")
        pass
    #print("last")
    return item

def analyze_done(it,block_ret):
    #print("in analyze_done")
    if type(it) is vast.Always:
        #print(it.statement.statements)
        #print(type(it.statement.statements))
        #block_ret=it
        x=type(it.statement.statements[0])
        y=it.statement.statements[0]
    elif type(it) is vast.IfStatement:
        x=type(it)
        y=it
    
    if  x is vast.IfStatement:
            #print(type(it.statement.statements[0].cond))
            #print(it.statement.statements[0].cond.left)
            #print(type(it.statement.statements[0].cond.left))
            #print("true statement")
            #print(it.statement.statements[0].true_statement)
            #print("false statement")
            #print(it.statement.statements[0].false_statement)
            #eq_first_left=
            #eq_first_right=
            #eq_second_left=
            #eq_second_right=

        item_false=y.false_statement
            #print(it.statement.statements[0].true_statement.statements[0])
        if type(y.true_statement.statements[0]) is vast.BlockingSubstitution:
                #print("blocking substitution")
                #if it.statement.statements[0].true_statement.statements[0].left.var.name=="ap_done":
            if type(y.false_statement) is vast.Block:
                    #print("here ap_done")
                string_temp="1'b0"
                overall_first_result=vast.IntConst(string_temp)
                item_new=vast.Eq(y.cond.left,overall_first_result)
                    #print(item_new)
                item_new1=vast.IfStatement(item_new,item_false,None)
                y.false_statement=item_new1

            elif type(y.false_statement) is vast.IfStatement:
                #print("here ap_done false")
                return(analyze_done(y.false_statement,block_ret))
            else:
                #print("last done block")
                print(type(it.statement.statements[0].false_statement))

    return block_ret

def part_select_module_assign_partsel(it,res,input_module,ret_block):
	msb=it.right.var.msb.value
	lsb=it.right.var.lsb.value
	print("part_select_module_assign_partsel ")
	if int(lsb)==0:
		print("part_select_module_assign_partsel lsb=0")
		item1=part_select_one(msb,lsb)
		item2=create_and(it.right.var.var,item1)
		it.right=item2
		#return ret_block


def part_select_module_pointer(it,res,input_module,ret_block):
	name_point=it.var.name
	if name_point !="ap_CS_fsm":
		size,value=extract_value_and_size(it.ptr.value)
		item1=create_new_variable(name_point)
		item2=create_intconst(size,value)
		item3=create_srl(it.var,item2)
		item4=create_assign(item1,item3,res)
		item5=create_intconst(1,1)
		item6=create_and(item4.left.var,item5)
		ret_block.right.var=item6
		#return ret_block
	#else:
		#return ret_block

def left_side_resolve(item,res,input_module,ret_block,right_msb,right_lsb):
	print("left side resolve")
	width=find_width(input_module,item.left.var.var.name)
	item6=part_select_two(right_msb,right_lsb,width,"left")
	item7=create_and(item.left.var.var,item6)
	item8=create_new_variable(item.left.var.var.name)
	final_item2=create_assign(item8,item7,res)
	return final_item2
	
def right_side_resolve(item,res,input_module,ret_block,right_msb,right_lsb):
	if int(right_lsb)==0:
		item1=part_select_one(right_msb,0)		
	else:
		width=find_width(input_module,item.right.var.var.name)
		item1=part_select_two(right_msb,right_lsb,width,"right")
	
	item2=item.right.var.var
	item3=create_and(item2,item1)
	item4=create_new_variable(item.right.var.var.name)
	final_item1=create_assign(item4,item3,res)
	return final_item1

def merge_left_right(final_item1,final_item2,res,item):
	item9=create_or(final_item1.left.var,final_item2.left.var)
	item10=create_new_variable(final_item1.left.var.name)
	final_item3=create_assign(item10,item9,res)
	item.left=item.left.var.var
	item.right=final_item3.left.var

def always_partsel_partsel(item,res,input_module,ret_block):
	print("always_partsel_partsel")
	right_msb=item.right.var.msb.value
	right_lsb=item.right.var.lsb.value
	final_item1=right_side_resolve(item,res,input_module,ret_block,right_msb,right_lsb)
	final_item2=left_side_resolve(item,res,input_module,ret_block,right_msb,right_lsb)
	merge_left_right(final_item1,final_item2,res,item)
	
def always_identifier_concat(item,res,input_module,ret_block):
	if type(item.right.var.list[0].list[0]) is vast.Partselect:
		name_right=item.right.var.list[0].list[0].var.name
		msb=item.right.var.list[0].list[0].msb.value
		lsb=item.right.var.list[0].list[0].lsb.value
		item1=create_intconst(1,int(lsb))
		item2=create_srl(item.right.var.list[0].list[0].var,item1)
		item3=create_new_variable(name_right)
		final_item1=create_assign(item3,item2,res)
		diff=int(msb)-int(lsb)
		item4=part_select_one(diff,0)
		item5=create_and(final_item1.left.var,item4)
		item6=create_new_variable(name_right)
		final_item2=create_assign(item6,item5,res)
		item.right=final_item2.left
		

def part_select_always_if(x,res,input_module,ret_block):
	size=len(x.true_statement.statements)
	print("in side function")
	i=0
	while i<size:
		item=x.true_statement.statements[i]
		if type(item.left.var) is vast.Partselect and type(item.right.var) is vast.Partselect:
			always_partsel_partsel(item,res,input_module,ret_block)

		elif type(item.left.var) is vast.Partselect and type(item.right.var) is vast.IntConst:
			print("here in part selet and int cont")

		elif type(item.left.var) is vast.Identifier and type(item.right.var) is vast.Concat:
			always_identifier_concat(item,res,input_module,ret_block)
		i=i+1

def non_block_ps_const(item,res,input_module,ret_block):
	name=item.left.var.var.name
	msb=item.left.var.msb.value
	lsb=item.left.var.lsb.value
	if int(lsb)==0:
		width=find_width(input_module,name)
		item1=part_select_two(msb,0,width,"left")
		item2=create_and(item.left.var.var,item1)
		item.right.var=item2
		item.left.var=item.left.var.var
	else:
		width=find_width(input_module,name)
		lsb=int(lsb)
		item1=part_select_two(msb,lsb,width,"left")
		item2=create_and(item.left.var.var,item1)
		item.right.var=item2
		item.left.var=item.left.var.var

def non_block_pointer_const(item,res,input_module,ret_block):
	pointer_index=item.left.var.ptr.value
	msb=pointer_index
	constant_value=item.right.var.value
	length=len(constant_value)
	value=constant_value[length-1]
	width=find_width(input_module,item.left.var.var.name)
	item1=part_select_two(msb,msb,width,"left")
	item2=create_and(item.left.var.var,item1)
	item.right.var=item2
	item.left=item.left.var

def part_select_always_non_block(x,res,input_module,ret_block,no_of_statements):
	size=no_of_statements	
	i=0
	while i<size:
		item=x.statement.statements[i]
		if type(item.left.var) is vast.Partselect and type(item.right.var) is vast.IntConst:
			non_block_ps_const(item,res,input_module,ret_block)
		elif type(item.left.var) is vast.Pointer and type(item.right.var) is vast.IntConst:
			non_block_pointer_const(item,res,input_module,ret_block)
		i=i+1

		

def part_select_module_always(it,res,input_module,ret_block):
	x=it.statement.statements[0]	
	if type(x) is vast.IfStatement:
		part_select_always_if(x,res,input_module,ret_block)
	elif type(x) is vast.NonblockingSubstitution:
		no_of_statements=len(it.statement.statements)
		part_select_always_non_block(it,res,input_module,ret_block,no_of_statements)
		

def part_select_module_assign(it,res,input_module,ret_block):
	if type(it.right.var) is vast.Partselect:
		part_select_module_assign_partsel(it,res,input_module,ret_block)
	elif type(it.right.var) is vast.Pointer:
		part_select_module_pointer(it.right.var,res,input_module,ret_block)


def concate_size_one(it,res,input_module,ret_block):
	x=it.right.var.list[0].list[0]
	if type(x) is vast.Partselect:
		msb=x.msb.value
		lsb=x.lsb.value
		item1=create_intconst(1,lsb)
		item2=create_new_variable(x.var.name)
		item3=create_srl(x.var,item1)
		final_item1=create_assign(item2,item3,res)
		diff=int(msb)-int(lsb)
		item4=part_select_one(diff,0)
		item5=create_and(final_item1.left.var,item4)
		item6=create_new_variable(x.var.name)
		final_item2=create_assign(item6,item5,res)
		it.right=final_item2.left

def concate_size_two(it,res,input_module,ret_block):
	first_item=it.right.var.list[0].list[0]
	second_item=it.right.var.list[1].list[0]
	if type(first_item) is vast.Identifier and type(second_item) is vast.Identifier:
		first_item_name=it.right.var.list[0].list[0].name
		second_item_name=it.right.var.list[1].list[0].name
		width=find_width(input_module,second_item_name)
		item1=create_intconst(1,width+1)
		item2=create_sll(first_item,item1)
		item3=create_new_variable(first_item_name)
		final_item1=create_assign(item3,item2,res)
		item4=create_or(final_item1.left.var,second_item)
		item5=create_new_variable(first_item_name)
		final_item2=create_assign(item5,item4,res)
		it.right=final_item2.left

	elif type(first_item) is vast.Identifier and type(second_item) is vast.IntConst:
		first_item_name=it.right.var.list[0].list[0].name
		second_item_name=it.right.var.list[1].list[0].value
		size,value=extract_value_and_size(second_item_name)
		if int(value)==0:
			item1=create_intconst(1,size)
			item2=create_sll(first_item,item1)
			item3=create_new_variable(first_item_name)
			final_item1=create_assign(item3,item2,res)
			it.right=final_item1.left

def concate_three_case1(first_item,second_item,third_item,it,res,input_module,ret_block):
	first_item_name=first_item.name
	second_item_name=second_item.name
	width_second=find_width(input_module,second_item_name)
	item1=create_intconst(1,width_second+1)
	item2=create_sll(first_item,item1)
	item3=create_new_variable(first_item_name)
	final_item1=create_assign(item3,item2,res)
	item4=create_or(final_item1.left.var,second_item)
	item5=create_new_variable(first_item_name)
	final_item2=create_assign(item5,item4,res)
	size,value=extract_value_and_size(third_item.value)
	if value==0:
		item6=create_intconst(1,size)
		item7=create_sll(final_item2.left.var,item6)
		item8=create_new_variable(first_item_name)
		item9=create_assign(item8,item7,res)
		it.right=item9.left

def concate_three_case2(first_item,second_item,third_item,it,res,input_module,ret_block):
	first_item_name=first_item.name
	size,value=extract_value_and_size(second_item.value)
	if value==0:
		item1=create_intconst(1,size)
		item2=create_sll(first_item,item1)
		item3=create_new_variable(first_item_name)
		final_item1=create_assign(item3,item2,res)
		third_item_name=third_item.name
		width_third_item=find_width(input_module,third_item_name)
		item4=create_intconst(1,width_third_item+1)
		item5=create_sll(final_item1.left.var,item4)
		final_item2=create_assign(item5,item4,res)
		item6=create_or(final_item2.left.var,third_item)
		item7=create_new_variable(first_item_name)
		final_item3=create_assign(item7,item6,res)
		it.right=final_item3.left


def concate_size_three(it,res,input_module,ret_block):
	print("concate case three")
	first_item=it.right.var.list[0].list[0].list[0]
	second_item=it.right.var.list[0].list[1].list[0]
	third_item=it.right.var.list[1].list[0]
	if type(first_item) is vast.Identifier and type(second_item) is vast.Identifier and type(third_item) is vast.IntConst:
		concate_three_case1(first_item,second_item,third_item,it,res,input_module,ret_block)
	elif type(first_item) is vast.Identifier and type(second_item) is vast.IntConst and type(third_item) is vast.Identifier:
		concate_three_case2(first_item,second_item,third_item,it,res,input_module,ret_block)



def concate_module_type(it,res,input_module,ret_block):
	print("concate module type")
	print(it.right.var.list[0].list)
	print(len(it.right.var.list[0].list))
	print(type(len(it.right.var.list[0].list)))
	size=len(it.right.var.list)
	if size==1:
		print("case 1")
		concate_size_one(it,res,input_module,ret_block)
	elif size==2:
		element=it.right.var.list[0].list[0]
		print(type(element))
		if type(element) is vast.Identifier or type(element) is vast.IntConst:
			print("case 3_1")
			concate_size_two(it,res,input_module,ret_block)
		else:
			print("case 3")
			concate_size_three(it,res,input_module,ret_block)


	

def part_select_module(it,res,input_module,ret_block):
	if type(it) is vast.Assign:
		if type(it.right.var) is vast.Partselect:
			part_select_module_assign(it,res,input_module,ret_block)
		elif type(it.right.var) is vast.Concat:
			concate_module_type(it,res,input_module,ret_block)

	elif type(it) is vast.Always:
		part_select_module_always(it,res,input_module,ret_block)
	
	return ret_block
	

def post_modification_right(item,res,input_module,ret_block):
	
	#print("inside post_modification_right")
	if type(item) is vast.Identifier:
		return item
	if type(item) is vast.Plus or vast.Minus or vast.GreaterThan or vast.LessThan or vast.Eql:		
		item_temp1=create_new_variable("temp_")
		final_item=create_assign(item_temp1,item,res)
		item=item_temp1
		if type(final_item.right.var.left) is vast.Partselect:
			item_temp2=create_new_variable("temp_")
			item_temp3=final_item.right.var.left
			msb=item_temp3.msb.value
			lsb=item_temp3.lsb.value
			if int(msb)==0 and int(lsb)==0:
				item4=create_intconst(1,1)
				item5=create_and(item_temp3.var,item4)
				item6=create_new_variable("temp_")
				final_item2=create_assign(item6,item5,res)
				final_item.right.var.left=final_item2.left			
	return item_temp1

def post_modification_left(it,res,input_module,ret_block):
	
	item1=create_new_variable("temp_")
	final_item=create_assign(item1,it,res)
	return_item=item1
	if type(final_item.right.var) is vast.Xor:
		item2=create_new_variable("temp_")
		final_item3=create_assign(item2,final_item.right.var.left,res)
		final_item.right.var.left=item2
		if type(final_item3.right.var) is vast.Cond:
			final_item3.right.var.true_value=post_modification_right(final_item3.right.var.true_value,res,input_module,ret_block)
			final_item3.right.var.false_value=post_modification_right(final_item3.right.var.false_value,res,input_module,ret_block)
		if type(final_item3.right.var) is vast.Eql:
			print("inside eql")
			'''
			if type(final_item3.right.var.left) is vast.Partselect:
				string_temp="temp_"+str(count)
				count=count+1
				item1=vast.Lvalue(vast.Identifier(string_temp))
				item2=vast.Rvalue(final_item3.right.var.left)
				final_item1=vast.Assign(item1,item2)
				resolve_ps=part_select_module(final_item1,res,input_module)
				final_item2=(vast.Assign(item1,resolve_ps.right.var),)
				final_item3.right.var.left=item1
				res.top_output.items+=final_item2
			'''
	return return_item

def post_modification(it,res,input_module,ret_block):
	if type(it) is vast.Assign:
		if type(it.right.var) is vast.Cond:
			it.right.var.true_value=post_modification_right(it.right.var.true_value,res,input_module,ret_block)
			it.right.var.false_value=post_modification_right(it.right.var.false_value,res,input_module,ret_block)
			it.right.var.cond.left=post_modification_left(it.right.var.cond.left,res,input_module,ret_block)
	return it
	#if type(it) is vast.Assign:
		#if type(it.right.var) is vast.Cond:
			#print("here")
			#print(type(it.right.var.true_value))
			#print(it.right.var.true_value)
			#it.right.var.true_value=post_modification_right(it.right.var.true_value,res,input_module,ret_block)
			#it.right.var.false_value=post_modification_right(it.right.var.false_value,res,input_module,ret_block)
			#it.right.var.cond.left=post_modification_left(it.right.var.cond.left,res,input_module,ret_block)
			#return it
def controller_obfuscation(it,list_working_key,user_key,res,cfg):
    print("inside controller obfusctaion")
    #print(len(it.statement.statements[0]))
    #print(len(it.statement.statements[0].caselist))
    #print("input key")
    #print(cfg.input_key)
    i=0
    
    total_states=len(it.statement.statements[0].caselist)
    print(it.statement.statements[0].caselist)
    random_shuffle=list(it.statement.statements[0].caselist)
    random.shuffle(random_shuffle)
    #print(random_shuffle)
    it.statement.statements[0].caselist=tuple(random_shuffle)
    print(it.statement.statements[0].caselist)
    
    i=0
    while i<len(it.statement.statements[0].caselist):
        #print(i)
        #print(type(i))
        #print(it.statement.statements[0].caselist[i].statement)
        #print(it.statement.statements[0].caselist[i].statement.statements[0])
        if type(it.statement.statements[0].caselist[i].statement.statements[0]) is vast.BlockingSubstitution:
            index=res.top_output.initial_working_key + res.top_output.key_bits
            #print(index)
            #print(cfg.input_key[index])
            key=cfg.input_key[index]
            #print(key)
            const=random.randint(0,1)
            res.top_output.key_bits=res.top_output.key_bits+1
            pointer_index=vast.IntConst(str(index))
            item1=vast.Pointer(vast.Identifier('working_key'),pointer_index)
            key_signal = vast.IntConst(str(1) + "\'b" + str(key))
            #print(temp)
            #item1=temp
            value="1\'b1"
            #item2=vast.IntConst(temp1)
            item3=vast.Eq(vast.Xor(item1, key_signal), vast.IntConst(value))
            #if list_working_key[0]==1 or list_working_key[0]==0:
            
            item4=it.statement.statements[0].caselist[i].statement.statements[0]       
            #item5=it.statement.statements[0].caselist[i].statement.statements[0]
            #item4=vast.Block.statements[0].append(item4)
            random_value=random.randint(1,total_states-1)
            dummy_state="ap_ST_fsm_state"+str(random_value)
            #print(item4.right.var)
            #print(type(item4.right.var))
            if type(item4.right.var) is vast.Identifier:
                while item4.right.var.name==dummy_state:
                    random_value=random.randint(1,total_states-1)
                    dummy_state="ap_ST_fsm_state"+str(random_value)


            
            dummy_state=vast.Identifier(dummy_state)
            dummy_state1=vast.Rvalue(dummy_state)
            #dummy_state=vast.Rvalue(dummy_state)
            item5=vast.BlockingSubstitution(item4.left.var,dummy_state1)
                       
            list1=[]
            list1.append(item4)
            list2=[]
            list2.append(item5)
            item_t=vast.Block(list1)
            item_t1=vast.Block(list2)
            wkey=const^int(key)^int(key)
            if wkey:
                key=int(key)
                #print("key")
                #print(key)
                #print("const")
                #print(const)
                wkey=const^key
                #print("wkey")
                #print(wkey)
                item6=vast.IfStatement(item3,item_t,item_t1)
            else:
                key=int(key)
                #print("key")
                #print(key)
                #print("const")
                #print(const)
                #print("wkey")
                wkey=const^key
                #print(wkey)
                item6=vast.IfStatement(item3,item_t1,item_t)
            
            cfg.working_key=cfg.working_key+str(wkey)
            l1=list(it.statement.statements[0].caselist[i].statement.statements)
            l1[0]=item6
            it.statement.statements[0].caselist[i].statement.statements=tuple(l1)

            #print(it.statement.statements[0].caselist[i].statement.statements[0].left)
            #print(it.statement.statements[0].caselist[i].statement.statements[0].right)
            #l1=list(it.statement.statements[0].caselist[i].statement.statements)
            #l1.append(it.statement.statements[0].caselist[i].statement.statements[0])
            #it.statement.statements[0].caselist[i].statement.statements=tuple(l1)
            #print(l1)
            #print(user_key)
            #user_key=user_key+1
        i=i+1

def perform_module_obfuscation(original_module, cfg,list_working_key,user_key):
    print(cfg)
    print("hello")
    print("perform module obfuscation")
    input_module = copy.deepcopy(original_module)
    module_instance = input_module.name + "_" + str(len(cfg.modules))
    #print(module_instance)

    res = obfuscation_data.ObfuscationResult()
    suffix = "_obf"
    res.top_output = obfuscation_data.ObfuscatedModule(module_instance + suffix, input_module.name)
    #print("res.top_output")
    #print(res.top_output.name)
    cfg.modules += (res.top_output,)
    #print(cfg.modules)


    res.top_output.params = input_module.paramlist
    #print("res.top_output.params")
    #print(res.top_output.params)
    ports = vast.Portlist(res.top_output.ports)
    #print(ports)


    if cfg.verbose:
        print("=Interface")
    for p in input_module.portlist.ports:
        res.top_output.ports += (p,)
    #print(res.top_output.ports)

    if cfg.verbose:
        print("=Parameter definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if type(p) is vast.Parameter:
                    res.top_output.definitions += (p,)

    #print("res.top_output.definitions")
    print(res.top_output.definitions)

    if cfg.verbose:
        print("=Port definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if type(p) is vast.Input:
                    port = vast.Input(p.name, p.width, p.signed)
                    res.top_output.definitions += (vast.Decl((port,)),)
                elif type(p) is vast.Output:
                    port = vast.Output(p.name, p.width, p.signed)
                    res.top_output.definitions += (vast.Decl((port,)),)

    #print(res.top_output.definitions)

    if cfg.verbose:
        print("=Signal definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if not type(p) is vast.Input and not type(p) is vast.Output and not type(p) is vast.Parameter:
                    res.top_output.definitions += (p,)

    if cfg.verbose:
        print("=Items")
    starting_key = 0
    for it in input_module.items:
        if type(it) is vast.Decl:
            continue
        elif type(it) is vast.InstanceList:
            print("instance list")
            for inst in it.instances:
                int_module = False
                for module in cfg.ast.description.definitions:
                    if type(module) is vast.Pragma:
                        continue
                    if module.name == inst.module:
                        int_module = module
                if int_module:
                    mod_res = perform_module_obfuscation(int_module, cfg,list_working_key,res = perform_module_obfuscation(top_module, cfg,list_working_key,key_value))
                    for m in mod_res.modules:
                        res.modules[m] = mod_res.modules[m]
                    res.list_files.extend(mod_res.list_files)
                    it.module = mod_res.top_output.name
                    if mod_res.top_output.key_bits == 1:
                        key_port = vast.Pointer(vast.Identifier('working_key'), vast.IntConst(starting_key))
                    else:
                        key_msb = vast.IntConst(starting_key + mod_res.top_output.key_bits - 1)
                        key_lsb = vast.IntConst(starting_key)
                        key_port = vast.Partselect(vast.Identifier('working_key'), key_msb, key_lsb)
                    starting_key += mod_res.top_output.key_bits
                    positional_binding = False
                    for p in inst.portlist:
                        if p.portname is None:
                            positional_binding = True
                    if positional_binding:
                        inst.portlist += (vast.PortArg(None, key_port),)
                    else:
                        inst.portlist += (vast.PortArg('working_key', key_port),)
                    res.top_output.module_key += mod_res.top_output.module_key

    #print("starting_key")
    #print(starting_key)
    count=0
    list_notvalid=[]
    res.top_output.initial_working_key = starting_key
    obf_bits = obfuscation_data.ObfuscationBits(res.top_output.name)
    for it in input_module.items:
        if type(it) is vast.Decl:
                continue
        #if type(it) is vast.Assign:
                #it = analyze_item1(it,res,list_notvalid)
        if it not in list_notvalid:
            apply_operation_obf=0
            it = analyze_item(it, cfg, res, -1, obf_bits,apply_operation_obf,list_working_key,user_key)
            #it=  post_modification(it,res,input_module,it)
            #it = part_select_module(it,res,input_module,it)
            #it = concate_module(it,res,input_module,it)
        if type(it) is vast.Always:
            if type(it.statement) is vast.Block:
                if type(it.statement.statements[0]) is vast.CaseStatement:
                    controller_obfuscation(it,list_working_key,user_key,res,cfg)
                    print("inside controller")
                    print("inside always")
                    print("inside always")
	        
        #if type(it) is vast.Always:
	        #it=analyze_done(it,it)

        if not type(it) is vast.Pragma:
            res.top_output.items += (it,)
    res.modules[res.top_output.name] = obf_bits

    global total_branch
    global total_constant
    global total_operations
    global total_working_key
    total_branch=total_branch+res.num_branches
    total_operations=total_operations+res.num_ops
    total_constant=total_constant+res.num_consts
    #total_working_key=total_working_key+res.working_key
    res.write_report(cfg)

    # generation of obfuscated module
    if cfg.obfuscate:
        if input_module.name == cfg.top:
            width = vast.Width(vast.IntConst(str(len(cfg.input_key) - 1)), vast.IntConst('0'))
            key_port = vast.Port('locking_key', width, None, None)
            res.top_output.ports += (key_port,)
            if len(cfg.input_key) > 1:
                width = vast.Width(vast.IntConst(str(len(cfg.input_key) - 1)), vast.IntConst('0'))
                key_port = vast.Input('locking_key', width)  # add True for signed signal
            if len(cfg.input_key) == 1:
                key_port = vast.Input('locking_key')
            res.top_output.definitions += (vast.Decl((key_port,)),)
            if res.top_output.initial_working_key + res.top_output.key_bits > 0:
                sig = vast.Identifier("working_key")
                if len(cfg.working_key) > 0:
                    width = vast.Width(vast.IntConst(str(len(cfg.working_key) - 1)), vast.IntConst('0'))
                    res.top_output.definitions += (vast.Wire("working_key", width),)
                if res.top_output.key_bits > 1:
                    replica = int(len(cfg.working_key) / len(cfg.input_key))
                    additional_bits = int(len(cfg.working_key) % len(cfg.input_key))
                    list_sig = ()
                    if additional_bits > 1:
                        key_msb = vast.IntConst(str(additional_bits - 1))
                        key_lsb = vast.IntConst('0')
                        key_part = vast.Partselect(vast.Identifier('locking_key'), key_msb, key_lsb)
                    for i in range(0, replica):
                        key_part = vast.Identifier('locking_key')
                    list_sig += (key_part,)
                    assign = vast.Concat(list_sig)
                    res.top_output.items += (vast.Assign(sig, assign),)
                else:
                    sig1 = vast.Pointer(vast.Identifier("locking_key"), vast.IntConst('0'))
                    res.top_output.items += (vast.Assign(sig, sig1),)
        else:
            if res.top_output.key_bits > 0:
                width = vast.Width(vast.IntConst(str(res.top_output.key_bits - 1)), vast.IntConst('0'))
                key_port = vast.Port('working_key', width, None, None)
                res.top_output.ports += (key_port,)
                if res.top_output.key_bits > 0:
                    width = vast.Width(vast.IntConst(str(res.top_output.key_bits - 1)), vast.IntConst('0'))
                    key_port = vast.Input('working_key', width)  # add True for signed signal
                res.top_output.definitions += (vast.Decl((key_port,)),)
    ports = vast.Portlist(res.top_output.ports)
    ast = vast.ModuleDef(res.top_output.name, res.top_output.params, ports,
                         res.top_output.definitions + res.top_output.items)

    # generation of verilog files
    if user_key == 1:
        v_filename = "hdl2/" + res.top_output.name+"_key_1" + ".v"
    else:
        v_filename = "hdl2/" + res.top_output.name+"_key_0" + ".v"
    output_generation.generate_ast(ast, v_filename)
    res.list_files.append([res.top_output.name, v_filename])

    # generation of wrappers
    if cfg.obfuscate:
        output_generation.generate_wrappers(input_module, res, cfg)
        output_generation.generate_formality_tcl(input_module, res, cfg)

    print("")
    print("working key")
    #print(cfg.working_key)
    c_name= "hdl2/"+res.top_output.name+"working_key"+".txt"
    f= open(c_name,"w+")
    for val in cfg.working_key:
    	f.write(val)
    	f.write("\n")
    #print(cfg.working_key[0])
    #print(cfg.working_key[1])
    #print(cfg.working_key[2])
    #print(cfg.working_key[3])
    return res


def main():
    INFO = "ASSURE: Algorithmic-Level Obfuscation"
    VERSION = 1.0
    USAGE = "Usage: python assure.py -t top_name -k locking_key file ..."

    def showVersion():
        print(INFO)
        print(VERSION)
        print(USAGE)
        sys.exit()

    optparser = OptionParser()

    optparser.add_option("-V", "--version", action="store_true", dest="showversion",
                         default=False, help="Show the version")
    # options related to Verilog parsing
    optparser.add_option("-v", "--verbose", action="store_true", dest="verbose",
                         default=False, help="Verbose execution")
    optparser.add_option("-I", "--include", dest="include", action="append",
                         default=[], help="Include path")
    optparser.add_option("-D", dest="define", action="append",
                         default=[], help="Macro Definition")
    # options related to top specification
    optparser.add_option("-t", "--top", action="store", dest="top",
                        default=False, help="Specify the name of the module to obfuscate")
    # options related to locking key
    optparser.add_option("-k", "--locking-key", action="store", dest="input_key",
                         default=False, help="Specify the input locking_key")
    # options related to obfuscation techniques
    optparser.add_option("-a", "--obfuscate", action="store_true", dest="obfuscate_all",
                         default=False, help="Obfuscate entire design")
    optparser.add_option("-c", "--obfuscate-const", action="store", dest="obfuscate_const",
                         default=False, help="Specify the minimum number of bits for the constants to obfuscate")
    optparser.add_option("-b", "--obfuscate-branch", action="store_true", dest="obfuscate_branch",
                         default=False, help="Obfuscate conditional branches")
    optparser.add_option("-o", "--obfuscate-ops", action="store_true", dest="obfuscate_ops",
                         default=False, help="Obfuscate operators")
    optparser.add_option("-u", "--obfuscate-entire-design", action="store_true", dest="unfold_key",
                         default=False, help="Manage the key if needed to obfuscate the entire design")
    # options related to security analysis
    optparser.add_option("-w", "--generate-wrong-keys", action="store", dest="wrong_keys",
                         default=0, help="Generate wrappers to test wrong keys")

    ### execution setup
    total_files=1#int(input("Enter the number of files:"))
    if total_files<=0:
        raise Exception("atleast single required:")
    i=0
    main_dic={}
    all_files=[]
    while i<total_files:
        file_name="hls_macc.v"#input("Enter the name of file:")
        top_name="hls_macc"#input("Enter the name of top module:")
        all_files.append(file_name)
        (options, args) = optparser.parse_args()
        #print(args)
        options.top=top_name
        cfg = obfuscation_data.ObfuscationConfig(options,args,file_name,top_name)	
        main_dic[file_name]=cfg
        print(file_name)
        print(main_dic[file_name])	
        i=i+1
    
    for keys in main_dic.keys():
        print(keys)
    key_available="No"#input("Working key available Yes/No:")
    #(options, args) = optparser.parse_args()
    #print(args)
    #print(options)
    print(len(args))
    if options.showversion or len(args) == 0:
        showVersion()
        #print("here")

    #cfg = obfuscation_data.ObfuscationConfig(options, args)
    #print(cfg)
    if not os.path.isdir("hdl"):
        os.mkdir("hdl")
    for keys in main_dic.keys():
        if main_dic[keys].obfuscate:
            if not os.path.isdir("wrappers"):
                os.mkdir("wrappers")
            if not os.path.isdir("scripts"):
                os.mkdir("scripts")
    ### setup is completed
    start = time.time()
    start_clk = clock()
    ### parsing of input files
    for keys in main_dic.keys():
        print("File Name: "+keys)
        cfg=main_dic[keys]
        print("Top Name: "+cfg.top)
        print("here")
        codeparser = VerilogCodeParser(cfg.filelist, preprocess_include=cfg.includes, preprocess_define=cfg.defines, debug=False)
        cfg.ast = codeparser.parse()
        #print(cfg.ast)
        cfg.ast.show()
        #print(cfg)
    	#if cfg.verbose:
        #print("hello verbose")
        #cfg.ast.show()
    	### input files correctly parsed

        print("")
    	### performing hierarchial obfuscation/analysis
        top_module = None
        for module in cfg.ast.description.definitions:
            print(module)
            if isinstance(module, vast.ModuleDef):
                print(module.name)
                if module.name == cfg.top:
                    top_module = module
                    print(top_module)
    
        list_working_key=[]
        res=0
        if key_available =="Yes" or key_available=="yes":
            print("here yes")
            user_key=1
            file_name="hdl2/"+top_module.name+"_0_obfworking_key.txt"
            list_working_key=[]
            for line in open(file_name):
                if line.strip():           # line contains eol character(s)
            	    n = int(line)
            	    list_working_key.append(n)
            #list_working_key.reverse()
            #print(list_working_key)
            #print(list_working_key[64:96])
            if not top_module:
                raise Exception("Top module \"" + options.top + "\" is missing")
            else:
                res = perform_module_obfuscation(top_module, cfg,list_working_key,user_key)
        elif key_available=="No" or key_available=="no":
            user_key=0
            print("here no")
            print("key not available")
            if not top_module:
                raise Exception("Top module \"" + options.top + "\" is missing")
            else:
                res = perform_module_obfuscation(top_module, cfg,list_working_key,user_key)
                
        else:
            raise Exception("Invalid key input either yes or no")

        
        print("------------------------------------------------------------------------------------")
        for f in res.list_files:
            spaces = 30 - len(f[0])
            print("| " + f[0] + ' '*spaces + " | File = \"" + f[1] + "\"")
        print("------------------------------------------------------------------------------------")
    

    
    #print("key value")
    #print(key_value)
    #res = perform_module_obfuscation(top_module, cfg,list_working_key,key_value)
    ### obfuscation/analysis is completed
    '''
    print("------------------------------------------------------------------------------------")
    for f in res.list_files:
        spaces = 30 - len(f[0])
        print("| " + f[0] + ' '*spaces + " | File = \"" + f[1] + "\"")

    print("------------------------------------------------------------------------------------")
    '''
    ### clean output
    if os.path.isdir("__pycache__"):
        shutil.rmtree("__pycache__")
    if os.path.isfile("parsetab.py"):
        os.remove("parsetab.py")
    ### everything is completed
   

    print("Total Constant:   "+str(total_constant))
    print("Total Condition:  "+str(total_branch))
    print("Total Operation:  "+str(total_operations))
    #print("Total Working Key "+str(total_working_key))
    end = time.time()
    end_clk=clock()
    print(f"Total Execution Time:  {end-start}")
    print(f"Total Execution2 Time:  {end_clk-start_clk}")

if __name__ == '__main__':
    main()
