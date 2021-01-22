require 'pp'

Dir.glob('kinmu/*') do |fpath|
    #printf("fpathは：[%s]\n",fpath)
  
    fname = File.basename(fpath)
    printf("ファイル名は：[%s]\n",fname)
    #printf("拡張子は　　：[%s]\n",File.extname(fpath))
    sum = 0
    aa=[]
    # ファイルの中身を読み込んで処理するなら
    fp=open(fpath)
    # 行単位の処理
    fp.each_line{|line|
      next if line[0]=='#' # skip header line
      
      line.chomp!
      ary = line.split
      next if ary[0].nil? == true
      #date   = ary[0]
      iri = ary[1]
      iridata = iri.partition(":")
      ih = iridata[0].to_i
      im = iridata[2].to_i
      agari = ary[2]
      agadata = agari.partition(":")
      ah = agadata[0].to_i
      am = agadata[2].to_i
      per = ary[3].to_f

      if (am >= im)
        hours = ah - ih
        minutes = am - im
      else
        hours = ah - ih -1
        minutes = 60 - (im -am)
      end

      minutes += hours * 60
      p = per / 100
      kadoum = minutes * p
      sum += kadoum
    
      #money = ary[4].to_i
      #ary =[ iri, agari, per]
      #aa.push(ary)
    }
    #pp sum
    kadouh = sum / 60
    fp.close
 
    printf("稼働時間は%.1f時間です\n\n",kadouh)
   # pp kadoum   
  
end