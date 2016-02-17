--[[
This file is used to parse the STL-10 dataset into one Tensor.
By Jake Zhao @NYU
For DS-GA-1008 2016 Spring
--]]


function parseDataLabel(d, numSamples, numChannels, height, width)
   local t = torch.ByteTensor(numSamples, numChannels, height, width)
   local l = torch.ByteTensor(numSamples)
   local idx = 1
   for i = 1, #d do
      local this_d = d[i]
      for j = 1, #this_d do
    t[idx]:copy(this_d[j])
    l[idx] = i
    idx = idx + 1
      end
   end
   assert(idx == numSamples+1)
   return t, l
end


-- Usage example, parsing the train data
--train_data = torch.load('../kaggle/train.t7b')
--parse_train_data, parse_train_label = parseDataLabel(train_data.data, 4000, 3, 96, 96)
--torch.save('parsed_train.t7b', parse_train_data)
