unit ReportDodatok3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls , ENPlanWorkController,
  ExtCtrls, CheckLst, InvokeRegistry, Rio, SOAPHTTPClient, TB2Item, TB2Dock,
  TB2Toolbar, ActnList, ImgList,DateUtils;

type
  TFrmReportDodatok3 = class(TDialogForm)
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    edtYearGen: TComboBox;
    lblYearGen: TLabel;
    rgReportType: TRadioGroup;
    chkOnlyZatvAct: TCheckBox;
    HTTPRIOENDepartment: THTTPRIO;
    gbDepartments: TGroupBox;
    ListDepartment: TCheckListBox;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actSelectAll: TAction;
    actUndoSelect: TAction;
    tbActions: TTBToolbar;
    btnSelectAll: TTBItem;
    btnUndoSelect: TTBItem;
    edtBrigadeName: TEdit;
    lblBrigadeName: TLabel;
    chkshow_rza_dtu_iz_ovb: TCheckBox;
    GroupBox1: TGroupBox;
    rbCountStaffing: TRadioButton;
    rbCountPersonal: TRadioButton;
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lockDepartmentControllers(forOneDepartment : Boolean; forManyDepartments : Boolean);
    procedure ListDepartmentClickCheck(Sender: TObject);
    function renCode2FinPodrCode(renCode : Integer) : Integer;
    procedure actSelectAllExecute(Sender: TObject);
    procedure actUndoSelectExecute(Sender: TObject);
  private
    { Private declarations }
  public
    renCode: Integer;
    renName: String;
    pplankind : Integer;
    report_vid : Integer;

    ENPlanWorkObj: ENPlanWork;
    { Public declarations }
  end;

var
  FrmReportDodatok3: TFrmReportDodatok3;

implementation

{$R *.dfm}
 uses  FINExecutorController, ShowFINExecutor,
  ShowFINExecutorTree , ShowENDepartment , ENDepartmentController , ChildFormUnit , EnergyproController , DMReportsUnit, ENConsts ,
  Main;

procedure TFrmReportDodatok3.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';

  lockDepartmentControllers(true, true);

end;

procedure TFrmReportDodatok3.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isCheckPodr := true;
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
          lockDepartmentControllers(true, false);
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TFrmReportDodatok3.actSelectAllExecute(Sender: TObject);
var
i : Integer;
begin
  inherited;
     For i:=0 to ListDepartment.Count -1  do
    Begin
       if  ListDepartment.Checked[i] = false then
           ListDepartment.Checked[i] := true;
    End;
   lockDepartmentControllers(false, true);
end;

procedure TFrmReportDodatok3.actUndoSelectExecute(Sender: TObject);
var
i : Integer;
begin
  inherited;
     For i:=0 to ListDepartment.Count -1  do
    Begin
       if  ListDepartment.Checked[i] = true then
           ListDepartment.Checked[i] := false;
    End;
    lockDepartmentControllers(true, true);
end;

procedure TFrmReportDodatok3.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  renCodes : String;
  var ys,ms,ds,yf,mf,df: Word;
  i : Integer;
  department : ENDepartment;
begin

renCodes := '';


DecodeDate(edtDateStart.date,ys,ms,ds);
DecodeDate(edtDateFinal.date,yf,mf,df);


    For i:=0 to ListDepartment.Count -1  do
    Begin
       if  ListDepartment.Checked[i] = True then
       begin
           if Length(renCodes) > 0 then
           begin
           if ((( ys = 2012 ) AND ( ms > 7 )) or
              ( ys > 2012 )) then
                 renCodes := renCodes + ',' + IntToStr(  renCode2FinPodrCode(Integer( ListDepartment.Items.Objects[i] )) )
           else
                 renCodes := renCodes + ',' + IntToStr(  Integer( ListDepartment.Items.Objects[i] ) );
           end
           else
           begin
              if ((( ys = 2012 ) AND ( ms > 7 )) or
                ( ys > 2012 )) then
                 renCodes := IntToStr(  renCode2FinPodrCode(Integer( ListDepartment.Items.Objects[i] )) )
              else
                  renCodes := IntToStr(  Integer( ListDepartment.Items.Objects[i] ) )
           end;

       end;

    end;

  if  ((ms <> mf ) and (report_vid <> 4 ) and (report_vid <> 26 ) and (report_vid <> 27 ) ) then
    Begin
         Application.MessageBox(PChar('Звіт формується тільки в межах одного місяця  !!!'), PChar('Увага!'),MB_ICONWARNING);
         ModalResult:= mrNone;
    end
    else

     if edtDateStart.date > edtDateFinal.date then
        Begin
         Application.MessageBox(PChar('Початкова дата не може бути більшою за кінцеву дату !!!'), PChar('Увага!'),MB_ICONWARNING);
         ModalResult:= mrNone;
       end
     else
    if ((renCode <> 0) or (Length(renCodes) > 0) or (report_vid = 16) or
    (report_vid = 17) or (report_vid = 18) or (report_vid = 20) or
    (report_vid = 21) or (report_vid = 22) or (report_vid = 23) or
    (report_vid = 24) or (report_vid = 2125 )  or (report_vid = 26 ) or (report_vid = 27 ) ) then
     begin

      SetLength(argNames, 12);
      SetLength(args, 12);

      argNames[0] := 'pdate1';
     // args[0] := '25.02.2010';
      args[0] := DateToStr( edtDateStart.date );

      argNames[1] := 'pdate2';
      args[1] := DateToStr( edtDateFinal.date );

      argNames[2] := 'rencode';
      args[2] := IntToStr(renCode);

          if ((( ys = 2012 ) AND ( ms > 7 )) or
              ( ys > 2012 )) then

        begin
            args[2] := IntToStr(renCode2FinPodrCode(renCode));
        end;

      // Если выбраны несколько подразделений
      if(Length(renCodes) > 0) then args[2] := renCodes;

      argNames[3] := 'renname';
      args[3] := renName;

      argNames[4] := 'plankind'; // признак плана (задание факт = 4 : задание план = 3)
      if pplankind = 4 then
         args[4] := '4';
      if pplankind = 3 then
         args[4] := '3';
      if pplankind = 2 then
         args[4] := '2';
      if pplankind = 1 then
         args[4] := '1';

       argNames[5] := 'Year';
      if edtYearGen.Visible = True then
       args[5] := edtYearGen.Text
      else
       args[5] := '';

       argNames[6] := 'sr';
       if ( (report_vid = 52) or (report_vid = 2) or (report_vid = 12) or (report_vid = 27 ) ) then  // развернутый технический или развернутый енергосбыт  или премия
          args[6] := '1';
       if ( (report_vid = 53) or (report_vid = 3) or (report_vid = 11) or (report_vid = 26 ) ) then // свернутый технический или свернутый енергосбыт
          args[6] := '0';

       argNames[7] := 'brigadeName';
       args[7] := StringReplace(edtBrigadeName.Text, '*', '%', [rfReplaceAll, rfIgnoreCase]);

//        if ((report_vid = 4 )and (renCode > 0 )) then // test
//        begin
//          department := DMReports.getDepartmentByCode(renCode);
//        end;


      //reportName := 'NPZ_dodat3_var2/dodat3';
     if report_vid = 1 then
        reportName := 'NPZ_dodat3_var2_razd/dodat3';
     if report_vid = 2 then
          //  reportName := 'NPZ_dodat3_var2_migr_hum/dodat3'; // для отчета развернутого по работникам
        // mdax-441
        if DMReports.UsesMDAXDataForReport = false then
          reportName := 'NPZ_dodat3_var2_svern_razv/dodat3'   // для отчета свернутого и развернутого вместе
        else
          reportName := 'NPZ_dodat3_var2_svern_razv/dodat3AX';

     if report_vid = 52 then
          reportName := 'NPZ_dodat3_var2_svern_razv_other_personal/ax_dodat3';   // po personalu other personal

     if report_vid = 3 then
          // reportName := 'NPZ_dodat3_var2_sht/dodat3';
          if DMReports.UsesMDAXDataForReport = false then
            reportName := 'NPZ_dodat3_var2_svern_razv/dodat3'    // для отчета свернутого и развернутого вместе
          else
            reportName := 'NPZ_dodat3_var2_svern_razv/dodat3AX';  //   штатное , работники из кадров

     if report_vid = 53 then
        reportName := 'NPZ_dodat3_var2_svern_razv_other_personal/ax_dodat3';  //   po brigadam other personal

     if report_vid = 4 then      // прогнозируемый за месяц
        reportName := 'NPZ_dodat3_var2_norms/dodat3';

     if report_vid = 5 then
       begin
        if chkOnlyZatvAct.Checked = false then
        reportName := 'RepPercentBonus/RepBonusParent';
        if chkOnlyZatvAct.Checked = true then
        reportName := 'RepPercentBonus2/RepBonusParent';
       end;
     if report_vid = 6 then      // прогнозируемый за год
       if DMReports.UsesMDAXDataForReport = false then
        reportName := 'NPZ_dodat3_var2_norms_year/dodat3_'
       else
        reportName := 'NPZ_dodat3_var2_norms_year/ax_dodat3_';

     if report_vid = 10 then     // прогнозируемый за месяц по энергозбыту
        if DMReports.UsesMDAXDataForReport = false then
         reportName := 'NPZ_dodat3_zbyt_norms/dodat3'
        else
         reportName := 'NPZ_dodat3_zbyt_norms/ax_dodat3';

     if report_vid = 11 then     // фактическая загрузка персонала по бригадам по энергозбыту
        // reportName := 'NPZ_dodat3_zbyt_sht/dodat3'; NET-4418
        if DMReports.UsesMDAXDataForReport = false then
         reportName := 'NPZ_dodat3_zbyt_svern_razv/sbt_dodat3'
        else
         reportName := 'NPZ_dodat3_zbyt_svern_razv/ax_sbt_dodat3';

     if report_vid = 12 then
        // для отчета развернутого по работникам  по енергозбыту
        // reportName := 'NPZ_dodat3_zbyt_migr_hum/dodat3';    NET-4418
        if DMReports.UsesMDAXDataForReport = false then
          reportName := 'NPZ_dodat3_zbyt_svern_razv/sbt_dodat3'
        else
          reportName := 'NPZ_dodat3_zbyt_svern_razv/ax_sbt_dodat3';

     if report_vid = 13 then
       if DMReports.UsesMDAXDataForReport = false then
         reportName := 'NPZ_dodat3_zbyt_norms_year/dodat3_'
       else
         reportName := 'NPZ_dodat3_zbyt_norms_year/ax_dodat3_';

     if report_vid = 14 then
        if DMReports.UsesMDAXDataForReport = false then
         reportName := 'NPZ_dodat3_zbyt_sht_year/dodat3_' // для отчета  енергозбыту для ХМВЕ
        else
         reportName := 'NPZ_dodat3_zbyt_sht_year/ax_dodat3_';
     if report_vid = 15 then      // прогнозируемый за месяц с заданий планов
       if DMReports.UsesMDAXDataForReport = false then
        reportName := 'NPZ_dodat3_var2_norms_zp/dodat3'  // SUPP-15256 - отчет учитывающий задания план в указанном периоде но месячные планы по нему были раньше начала периода формирования отчета
       else
        reportName := 'NPZ_dodat3_var2_norms_zp/ax_dodat3';

     if report_vid = 16 then      //
       if DMReports.UsesMDAXDataForReport = false then
        reportName := 'NPZ_dodat3_var2_norms_year_sum/dodat3_' // SUPP-24005 - Звіт по прогнозованому завантаженю технічного персоналу структуних підрозділів по річним планам на рік" з розбивкою по місяцям, бригадам, структурним підрозділам
       else
        reportName := 'NPZ_dodat3_var2_norms_year_sum/ax_dodat3_';

     if report_vid = 22 then      // за год с разбивкой по месяцам по мес планам
        if DMReports.UsesMDAXDataForReport = false then
         reportName := 'NPZ_dodat3_var2_norms_year_sum2/dodat3_' // SUPP-32303 - Звіт по прогнозованому завантаженю технічного персоналу структуних підрозділів по річним планам на рік" з розбивкою по місяцям, бригадам, структурним підрозділам
        else
         reportName := 'NPZ_dodat3_var2_norms_year_sum2/ax_dodat3_';

     if report_vid = 23 then      // за год с разбивкой по месяцам по мес планам
       if DMReports.UsesMDAXDataForReport = false then
        reportName := 'NPZ_dodat3_zbyt_norms_year_sum2/dodat3_' // SUPP-32303 - Звіт по прогнозованому завантаженю технічного персоналу структуних підрозділів по річним планам на рік" з розбивкою по місяцям, бригадам, структурним підрозділам
       else
        reportName := 'NPZ_dodat3_zbyt_norms_year_sum2/ax_dodat3_';

     if report_vid = 17 then      //
       if DMReports.UsesMDAXDataForReport = false then
        reportName := 'NPZ_dodat3_zbyt_norms_year_sum/dodat3_' // SUPP-24005 - Звіт по прогнозованому завантаженю збутового персоналу структуних підрозділів по річним планам на рік" з розбивкою по місяцям, бригадам, структурним підрозділам
       else
        reportName := 'NPZ_dodat3_zbyt_norms_year_sum/ax_dodat3_';

       if report_vid = 18 then
       begin
          SetLength(argNames, 4);
          SetLength(args, 4);
          reportName := 'award_percent_for_energozbyt/sbt_dodat3';

           argNames[3] := 'plankind'; // признак плана (задание факт = 4 : задание план = 3)
        if pplankind = 4 then
           args[3] := '4';
        if pplankind = 3 then
           args[3] := '3';
        if pplankind = 2 then
           args[3] := '2';
        if pplankind = 1 then
           args[3] := '1';

          argNames[2] := 'sr';
          args[2] := '1';

          argNames[1] := 'pdate2';
          args[1] := DateToStr( edtDateFinal.date );

          argNames[0] := 'pdate1';
          args[0] := DateToStr( edtDateStart.date );

       end;

     // премия технарям по шкале загрузок
      argNames[8] := 'planworkstatus';
     if report_vid = 19 then
       begin
        if chkOnlyZatvAct.Checked = false then
        args[8] := '0';
        if chkOnlyZatvAct.Checked = true then
        args[8] := '3'; // утвержденные планы
        // reportName := 'RepPercentBonusNew/RepBonusParent';
         // {tezzzt}reportName := 'PercentPremiums/Tech2/RepBonusParent';
         if DMReports.UsesMDAXDataForReport = false then
          reportName := 'PercentPremiums/Tech/PremiumsMain'
         else
          reportName := 'PercentPremiums/Tech/PremiumsMain';
          //reportName := 'PercentPremiums/Tech/ax_PremiumsMain'; // tezzzt 27.01.2016 - poka pust delayt kak bilo

       end;

       argNames[9] := 'show_rza_dtu_iz_ovb';
       if chkshow_rza_dtu_iz_ovb.Checked = true  then
       args[9]:='0'
       else
       args[9]:='1';

       argNames[10] := 'podr_str_kadry';
       if renCode > 0 then
          args[10]:='qqq'// DMReports.getDepartmentIdDownFromKadry(renCode)
       else
          args[10]:= '0';


       argNames[11] := 'countByStaffing';
       if rbCountPersonal.Checked = true then
       args[11]:= '0'
       else
       args[11]:= '1';



      if report_vid = 20 then
      begin
        // Процент премії по персоналу по шкалі навантаження(енергозбутова частина)
        // 26,06,2015 SUPP-34938 - reportName:=  'award_percent_for_energozbyt_new/sbt_dodat3';
         if DMReports.UsesMDAXDataForReport = false then
          reportName:= 'PercentPremiums/Zbyt/PremiumsMain'
         else
          reportName:= 'PercentPremiums/Zbyt/PremiumsMain'; // tezzzt 27.01.2016 - poka pust delayt kak bilo
          // reportName:= 'PercentPremiums/Zbyt/ax_PremiumsMain';

      end;

      if report_vid = 24 then
      begin
        // SUPP-42379
         // DMReports.UsesMDAXDataForReport = false then
          reportName:= 'PercentPremiums/ZbytInsp/PremiumsMain';

      end;

      if report_vid = 21 then
      begin
        // Процент премії по персоналу по шкалі навантаження(енергозбутова частина)
        // tezzzt  03.02.2016 нужно сформировать премию по ХМЕМ
        if DMReports.UsesMDAXDataForReport = false then
         reportName:=  'award_percent_for_energozbyt_hmem/sbt_dodat3'
        else
        reportName:=  'award_percent_for_energozbyt_hmem/ax_sbt_dodat3';

      end;
      if report_vid = 25 then
      begin
        // Процент премії по персоналу по шкалі навантаження(енергозбутова частина)
        // tezzzt  13.02.2019 нужно сформировать премию по н.каховке
        if DMReports.UsesMDAXDataForReport = false then
         reportName:=  'award_percent_for_energozbyt_nkah/sbt_dodat3'
        else
        reportName:=  'award_percent_for_energozbyt_nkah/ax_sbt_dodat3';

      end;

      if report_vid = 2125 then
      begin
        if DMReports.UsesMDAXDataForReport = false then
         reportName:=  'award_percent_for_energozbyt_nkah/sbt_dodat3'
        else
         reportName:=  'award_percent_for_energozbyt_hmemAndNKah/ax_sbt_dodat3';

      end;

      if report_vid = 26 then
         reportName := 'NPZ_dodat3_var2_hoeDept/dodat3AX';//Визначення коефіцієнту завантаження персоналу роботами виробничого характеру

      if report_vid = 27 then
         reportName := 'NPZ_dodat3_var2_hoe/dodat3AX_pers';//Визначення коефіцієнту завантаження персоналу роботами виробничого характеру c разбивкой по работникам

     if (( report_vid = 5 ) or (report_vid = 19 ))  then
      //if  report_vid <> 3 then   // 30.06.10 - все, кроме фактич. загрузки
      begin
       //try
        if rgReportType.ItemIndex = 0 then
          makeReportAuth(reportName, argNames, args, 'pdf')
        else
          makeReportAuth(reportName, argNames, args, 'xls');
       //except
       // ShowMessage('Нет прав ...');
       //end;
      end
      else
        makeReport(reportName , argNames , args , 'xls');

     end
     else
     begin
      Application.MessageBox(PChar('Для формування звіту необхідно обов`язково вибрати підрозділ!!!'), PChar('Увага!'),MB_ICONWARNING);
      if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
      ModalResult:= mrNone;
     end;
end;

procedure TFrmReportDodatok3.FormShow(Sender: TObject);
var
depFilter : ENDepartmentFilter;
depList : ENDepartmentShortList;
tempENDepartment : ENDepartmentControllerSoapPort;
i : Integer;
m,d,y:word;
show_rgReportType : boolean;
begin
  DisableControls([edtEPRenName]);
  DenyBlankValues([edtEPRenName]);

  show_rgReportType:= false;


  if ((report_vid = 13) or (report_vid = 10 ))  then
  begin
    GroupBox1.Visible:= true;
    GroupBox1.Top := 100;
  end;

  if ((report_vid = 5) or (report_vid = 19 )) then
  show_rgReportType := true;

  HideControls([chkshow_rza_dtu_iz_ovb],((report_vid <> 6) and (report_vid <> 15)) );



  HideControls([rgReportType], not show_rgReportType);
  HideControls([gbDepartments], report_vid <> 4);

  HideControls([edtEPRenName, spbEPRen, spbEPRenClear, lblEPRenName], report_vid = 18);
  // для премии по персоналу енергосбыта по шкале нагрузки скроем выбор РЕС(должен формироватться по всем сразу )
  HideControls([edtEPRenName, spbEPRen, spbEPRenClear, lblEPRenName], report_vid = 20);
 // для премии по персоналу ХМЕМ
  HideControls([edtEPRenName, spbEPRen, spbEPRenClear, lblEPRenName], report_vid = 21);
  // для загрузки на год по месячным  планам
  HideControls([edtEPRenName, spbEPRen, spbEPRenClear, lblEPRenName], report_vid = 22);
  // для загрузки на год по месячным  планам енергосбыт
  HideControls([edtEPRenName, spbEPRen, spbEPRenClear, lblEPRenName], report_vid = 23);


  if(gbDepartments.Visible = true) then
  begin
    // Заполнение списка
    tempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    depFilter := ENDepartmentFilter.Create;
    SetNullXSProps(depFilter);
    SetNullIntProps(depFilter);
    depFilter.conditionSQL := 'ENDEPARTMENT.PARENTREFCODE = ' + IntToStr(ENDEPARTMENT_REM) + ' OR ENDEPARTMENT.CODE IN (775,91,92,70,73,79,71)';
    depFilter.orderBySQL := 'ENDEPARTMENT.PARENTREFCODE, ENDEPARTMENT.NAME';
    depList := tempENDepartment.getScrollableFilteredList(depFilter, 0, -1);

    for i:= 0 to High(depList.list) do
    begin
      ListDepartment.Items.AddObject(depList.list[i].shortName  , TObject( depList.list[i].code )  );
    end;
  end;

  DecodeDate(now,y,m,d);
  edtDateFinal.DateTime := EndOfAMonth(y, m);
  edtDateFinal.Checked := true;

  edtDateStart.DateTime := EncodeDate(y,m,1);
  edtDateStart.Checked := true;

end;

procedure TFrmReportDodatok3.ListDepartmentClickCheck(Sender: TObject);
var i : Integer;
isAllUnChecked : Boolean;
begin
  inherited;
            isAllUnChecked := True;
            For i:=0 to ListDepartment.Count -1  do
            Begin
              if  ListDepartment.Checked[i] = True then
              Begin
               isAllUnChecked := False;
               Break;
              End;
            End;

            if(isAllUnChecked) then
                  lockDepartmentControllers(true, true)
            else
                  lockDepartmentControllers(false, true);
end;

procedure TFrmReportDodatok3.FormCreate(Sender: TObject);
begin
  report_vid:= 0; // сбрасываем вид отчета ... обычный вид или развернутый по персоналу
  ListDepartment.Items.Clear;  // Сбрасывается список подразделений
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, true);
  renCode:= 0;
end;

// Процедура лочит элементы управления (либо тот, что выбирает одно подразделение,
// или там где выбираются несколько)
// forOneDepartment - если true, то разблокируются те элементы управления, кот.
// отвечают за выбор одного подразделения, если false, то наоборот.
// forManyDepartments - если true, то разблокируются эл-ты управления, кот.
// отвечают за выбор многих подразделений, false - наоборот блокируются.
procedure TFrmReportDodatok3.lockDepartmentControllers(forOneDepartment : Boolean; forManyDepartments : Boolean);
var i : Integer;
begin
          spbEPRen.Enabled := forOneDepartment;
          spbEPRenClear.Enabled := forOneDepartment;

          if(not forOneDepartment) then
          begin
            if renCode > 0 then renCode := 0;
            if renName <> '' then renName := '';
            if edtEPRenName.Text <> '' then edtEPRenName.Text := '';

          end;

          ListDepartment.Enabled := forManyDepartments;
          actSelectAll.Enabled := forManyDepartments;
          actUndoSelect.Enabled := forManyDepartments;


          if not forManyDepartments then
          begin
            // Удаляется все выбранные подразделения
            For i:=0 to ListDepartment.Count -1  do
            Begin
              if  ListDepartment.Checked[i] = True then
                ListDepartment.Checked[i] := False;
            End;
          end;
end;

function TFrmReportDodatok3.renCode2FinPodrCode(renCode : Integer) : Integer;
var
  finCode : Integer;
begin
  finCode := renCode;
         case renCode of
         482: finCode := 830;
         732: finCode := 838;
         595: finCode := 831;
         484: finCode := 855;
         597: finCode := 834;
         729: finCode := 837;
         727: finCode := 845;
         637: finCode := 846;
         640: finCode := 847;
         662: finCode := 848;
         643: finCode := 850;
         641: finCode := 851;
         644: finCode := 852;
         642: finCode := 853;
         645: finCode := 854;
         end;

         renCode2FinPodrCode := finCode;
end;

end.
