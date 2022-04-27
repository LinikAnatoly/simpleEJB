unit FindMaterialForWriteOff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid , ENEstimateItemController,
  InvokeRegistry, Rio, SOAPHTTPClient, GridHeadersUnit, Menus, AdvObj, Buttons,
  ChildFormUnit ;

type
  TfrmFindMaterialForWriteOff = class(TDialogForm)
    pnl1: TPanel;
    pnl2: TPanel;
    spl1: TSplitter;
    pnl3: TPanel;
    btnSave: TButton;
    chkFindMatForWrite: TCheckBox;
    sgEstimateWriteOff: TAdvStringGrid;
    HTTPRIOENEstimateItem: THTTPRIO;
    pnlLegend: TPanel;
    shp1: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    btnCancel: TButton;
    pmfindmaterial: TPopupMenu;
    miN1: TMenuItem;
    edtMol: TEdit;
    spbMol: TSpeedButton;
    lblMol: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure chkFindMatForWriteClick(Sender: TObject);
    procedure ClearGrid(Sender: TObject);
    procedure miN1Click(Sender: TObject);
    procedure spbMolClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  masterMOLCode : String;
  masterMOLName : String;
  estimateFromNewplan : Integer;
  methodInsert : Integer; // (1-Добавить с сотрудников 2-добавить с подстанций)
  end;

var
  frmFindMaterialForWriteOff: TfrmFindMaterialForWriteOff;

  FindMaterialsWriteOffHeaders : array [1..11] of String =
        ( 'Код'
          ,'Назва матеріалу'
          ,'Од. вим.'
          ,'Доступна кількість'
          ,'Коригована кількість'
          ,'Таб.номер'
          ,'П.І.Б.'
          ,'Посада'
          ,'Підрозділ'
          ,'Дата вводу в експлуатацію'
          ,'Період експлуатації'
        );

   FindMaterialsWriteOffSubstationHeaders : array [1..11] of String =
        ( 'Код'
          ,'Назва матеріалу'
          ,'Од. вим.'
          ,'Доступна Кількість'
          ,'Коригована кількість'
          ,'Інв.номер'
          ,'Назва підстанції'
          ,'Назва підстанції(бух.)'
          ,'Підрозділ'
          ,'Дата вводу в експлуатацію'
          ,'Період експлуатації'
        );
    FindMaterialsWriteOffBrigadeHeaders : array [1..11] of String =
        ( 'Код'
          ,'Назва матеріалу'
          ,'Од. вим.'
          ,'Доступна Кількість'
          ,'Коригована кількість'
          ,'Інв.номер'
          ,'Назва бригади'
          ,'Служба'
          ,'Підрозділ'
          ,'Дата вводу в експлуатацію'
          ,'Період експлуатації'
        );
 const
 MATERIAL_COL_NUMBER   = 1; // № столбца 'Матеріал'
implementation

{$R *.dfm}

uses EditENPlanWriteOffProtection, ENConsts, ENPlanWorkController, XSBuiltIns,
  CorrectCountForWriteOffSZ, ShowFINMol, FINMolController;

procedure TfrmFindMaterialForWriteOff.FormShow(Sender: TObject);

begin
  DisableControls([edtMol]);
  edtMol.Text := masterMOLCode + ' ' + masterMOLName;
  if methodInsert = 1 then
  SetGridHeaders(FindMaterialsWriteOffHeaders, sgEstimateWriteOff.ColumnHeaders);
  if methodInsert = 2 then
  SetGridHeaders(FindMaterialsWriteOffBrigadeHeaders, sgEstimateWriteOff.ColumnHeaders);
  if methodInsert = 3 then
  SetGridHeaders(FindMaterialsWriteOffSubstationHeaders, sgEstimateWriteOff.ColumnHeaders);
  if ((methodInsert = 2) or (methodInsert = 3)) then
  chkFindMatForWrite.Checked:= True;

  chkFindMatForWriteClick(self);
end;

procedure TfrmFindMaterialForWriteOff.btnSaveClick(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemWriteOffList: ENEstimateItemWriteOffShortList;
  i , n : Integer;
  selected, state: Boolean;
  eArr :  ArrayOfENEstimateItemShort;
  eObj :  ENEstimateItemShort;
begin
  try
  TempENEstimateItem :=  HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  selected := false;

  for i := 1 to sgEstimateWriteOff.RowCount - 1 do
  begin
    sgEstimateWriteOff.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції для формування строк матеріалів на списання!'),
                           PChar('Увага!'), MB_ICONWARNING);
    frmFindMaterialForWriteOff.ModalResult:= mrNone;                           
    Exit;
  end;

  n := 0;
  state := false;
  for i := 1 to sgEstimateWriteOff.RowCount - 1 do
  begin
    sgEstimateWriteOff.GetCheckBoxState(1, i, state);
    if state then
    begin
       // проверим если в чекнутой строке откоректированное количество не указано тогда сообщим об этом .
       if ((sgEstimateWriteOff.Cells[4,i] = '' ) or (sgEstimateWriteOff.Cells[4,i] = '0'))  then
       begin
        Application.MessageBox(PChar( 'Матеріал ' +  sgEstimateWriteOff.Cells[1,i] + ' ' + ' Не вказано кількість яку необхідно списати !'),
                           PChar('Увага!'), MB_ICONWARNING);
        frmFindMaterialForWriteOff.ModalResult:= mrNone;
        Exit;
       end;
       n := n + 1;
    end;
    state := False;
  end;


  SetLength(eArr, n);
  n := 0;
  state := false;
  // формируем лист с эстимейтами

  for i := 1 to sgEstimateWriteOff.RowCount - 1 do
  begin
    sgEstimateWriteOff.GetCheckBoxState(1, i, state);
    if state then
    begin
       eObj := ENEstimateItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       eObj.code :=  StrToInt( sgEstimateWriteOff.Cells[0, i] );
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgEstimateWriteOff.Cells[4, i]; // берем откоректированное кол-во

       eObj.userGen:=  sgEstimateWriteOff.Cells[5,i]; // tabnumber worker or invNumber object
       eObj.materialRefName:= sgEstimateWriteOff.Cells[6,i]; // fio worker or name object
       eObj.orderNumber := sgEstimateWriteOff.Cells[8,i]; // department worker or department object

       eArr[n] := eObj;
       n := n + 1;
    end;
    state := False;
  end;

  if (High(eArr) >= 0) then
    TempENEstimateItem.addForWriteOffFromEstimateList(frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.code , eArr)
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    frmFindMaterialForWriteOff.ModalResult:= mrNone;
    Exit;
  end;
  finally
   
  end;

end;

procedure TfrmFindMaterialForWriteOff.chkFindMatForWriteClick(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemWriteOffList: ENEstimateItemWriteOffShortList;
  i , j: Integer;
  filstr : String;
begin
       filstr:= '';
       ClearGrid(Sender);
       sgEstimateWriteOff.RemoveCheckBox(1, 1);

    // выборка материалов на списание
    // фильтр для выборки
    // если МБП тогда ищем материалы которыйе вводились на счета начинающееся с 22

     if frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS] then
        filstr:= ' and f.bal_sch like ''22%'' ' ;
    // если МНМА тогда ищем материалы которыйе вводились на счета начинающееся с 15
    
     if frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA then
       filstr:= ' and f.bal_sch like ''15%'' ' ;

    // накидываем мол с которого ищем материалы
    // SUPP-87526 МОЛ уволился , на нем остались введенные средства защиты , списать не могут, из за того что вводили не на этого мола с которого списывают
    // обрежем МОЛ до 2 знаков (типа в том же рес).
//      if methodInsert = 1 then
//      filstr := filstr + ' and f.div_code like ' + ''''+copy(masterMOLCode,1,2)+'%'+'''';
//      if ((methodInsert = 2) or (methodInsert = 3))  then
//      filstr := filstr + ' and o.moloutcode like ' + ''''+copy(masterMOLCode,1,2)+'%'+'''';
    // SUPP-88654   Списання засобів захисту возврат поиска по МОЛ полному коду
      if methodInsert = 1 then
      filstr := filstr + ' and f.div_code = ' + ''''+masterMOLCode+'''';
      if ((methodInsert = 2) or (methodInsert = 3))  then
      filstr := filstr + ' and o.moloutcode = ' + ''''+masterMOLCode+'''';


    // накидываем условие показывать все средства защиты или только у которых кончилось период использования
    // сравниваем дату ввода в эксплуатацию и дата старт на плане ...
     if DialogState = dsInsert then
     begin
      if chkFindMatForWrite.Checked = false then
//      filstr := filstr + ' and ((tu.countmonth <= _diffmonth(o.dategen, to_date(' +''''+frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.dateStart.NativeToXS+''''+','+''''+'dd.mm.yyyy'+'''' +') ) ) and (tu.countmonth < 100 ) or (tu.countmonth is null or tu.countmonth > 100)) ';
      filstr := filstr + ' and ((tu.countmonth <= _diffmonth(o.dategen, to_date(' +''''+DateToStr(EncodeDate(frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.dateStart.Year,frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.dateStart.Month,frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.dateStart.Day))+''''+','+''''+'dd.mm.yyyy'+'''' +') ) ) and (tu.countmonth < 100 ) or (tu.countmonth is null or tu.countmonth > 100)) ';

     end;

     if DialogState = dsView then
     begin
       filstr := filstr + ' and  f.estimateitemrefcode in (  Select e2e.estimateiteminrefcode from enestimateitem2nstmttm e2e ' +
                                                             ' where e2e.estimateitemoutrefcode = ' +  IntToStr(estimateFromNewplan) +
                                                               ' and e2e.typerefcode = 6 ) ';
     end;

     // для поиска добавляем условие что бы отсекал те которые уже списаны в других планах
     if DialogState = dsInsert then
       filstr := filstr +  {'    and ei.code not in ' +
                                    '               ( ' +
                                    ' select n2n.estimateiteminrefcode ' +
                                    ' from enestimateitem2nstmttm n2n , ' +
                                    ' enestimateitem eitem, enplanwork plan ' +
                                    ' where n2n.estimateiteminrefcode = ei.code ' +
                                    ' and n2n.estimateitemoutrefcode = eitem.code ' +
                                    ' and eitem.planrefcode = plan.code ' +
                                    ' and plan.statuscode = 3 ' +
                                    ' ) ' +
                                    ' and ei.statusrefcode = 6 ' + } 
                                    ' and i2e.countgen -  coalesce(( select sum(coalesce(nn2nn.countgen,0)) from  enestimateitem2nstmttm nn2nn where nn2nn.estimateiteminrefcode = ei.code and nn2nn.typerefcode = 6 ),0)  <> 0     ';





    TempENEstimateItem :=  HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    if methodInsert = 1 then // лист для выборки материалов с работников
    ENEstimateItemWriteOffList := TempENEstimateItem.getScrollableFilteredListWriteOff(filstr);
    if methodInsert = 2 then // лист для выборки материалов с бригад
    ENEstimateItemWriteOffList := TempENEstimateItem.getScrollableFilteredListWriteOffBrigade(filstr);
    if methodInsert = 3 then // лист для выборки материалов с подстанций
    ENEstimateItemWriteOffList := TempENEstimateItem.getScrollableFilteredListWriteOffSubstation(filstr);




     if High(ENEstimateItemWriteOffList.list) > -1 then
         sgEstimateWriteOff.RowCount:=High(ENEstimateItemWriteOffList.list)+2
      else
         sgEstimateWriteOff.RowCount:=2;

       with sgEstimateWriteOff do
        for i:=0 to High(ENEstimateItemWriteOffList.list) do
          begin
            Application.ProcessMessages;

            if ENEstimateItemWriteOffList.list[i].checkplan <> Low(Integer)  then
               sgEstimateWriteOff.RowColor[i + 1] := clSilver
            else
               sgEstimateWriteOff.RowColor[i + 1] := clWindow;

            if ENEstimateItemWriteOffList.list[i].estimateitemrefcode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENEstimateItemWriteOffList.list[i].estimateitemrefcode)
            else
            Cells[0,i+1] := '';
             if DialogState = dsInsert then
              // if ENEstimateItemWriteOffList.list[i].checkplan = Low(Integer)  then  временно уберем 
                  AddCheckBox(1, i+1, false, false);

            Cells[1,i+1] := ENEstimateItemWriteOffList.list[i].enmatname;

            Cells[2,i+1] := ENEstimateItemWriteOffList.list[i].enmeasurementname;

            if DialogState = dsInsert then
            begin
                if ENEstimateItemWriteOffList.list[i].countgen  = nil then
                Cells[3,i+1] := ''
                else
                Cells[3,i+1] := ENEstimateItemWriteOffList.list[i].countgen.DecimalString;

                if ENEstimateItemWriteOffList.list[i].countgen  = nil then
                Cells[4,i+1] := ''
                else
                begin
                 if StrToInt(ENEstimateItemWriteOffList.list[i].countgen.DecimalString) = 1 then
                  Cells[4,i+1] := ENEstimateItemWriteOffList.list[i].countgen.DecimalString
                 else
                  Cells[4,i+1] := '';
                end;
            end;
            if DialogState = dsView  then
            begin
                if ENEstimateItemWriteOffList.list[i].countgenForView  = nil then
                begin
                Cells[3,i+1] := '';
                Cells[4,i+1] := '';
                end
                else
                begin
                Cells[3,i+1] := ENEstimateItemWriteOffList.list[i].countgenForView.DecimalString;
                Cells[4,i+1] := ENEstimateItemWriteOffList.list[i].countgenForView.DecimalString;
                end;
            end;

            Colors[4, i + 1] := $0080FF80;

            Cells[5,i+1] := ENEstimateItemWriteOffList.list[i].tabnumber;

            Cells[6,i+1] := ENEstimateItemWriteOffList.list[i].fio;

            Cells[7,i+1] := ENEstimateItemWriteOffList.list[i].profesion;

            Cells[8,i+1] := ENEstimateItemWriteOffList.list[i].depname;

            Cells[9,i+1] := ENEstimateItemWriteOffList.list[i].dateloadexpl;

            Cells[10,i+1] := ENEstimateItemWriteOffList.list[i].countmonth_txt;

            sgEstimateWriteOff.RowCount:=High(ENEstimateItemWriteOffList.list)+2;

          end;
       //ColCount:=ColCount+1;
       sgEstimateWriteOff.Row:=1;


end;

procedure TfrmFindMaterialForWriteOff.ClearGrid(Sender: TObject);
Var i, j: Integer;
begin


   for i:=1 to sgEstimateWriteOff.RowCount-1 do
     for j:=0 to sgEstimateWriteOff.ColCount-1 do
       sgEstimateWriteOff.Cells[j,i]:='';

 end;

procedure TfrmFindMaterialForWriteOff.miN1Click(Sender: TObject);
begin
  frmCorrectCountForWriteOffSZ := TfrmCorrectCountForWriteOffSZ.Create(Application, dsInsert);
      try

         if frmCorrectCountForWriteOffSZ.ShowModal = mrOK then
         begin
             // UpdateGrid(Self);
            if StrToInt(sgEstimateWriteOff.Cells[3,sgEstimateWriteOff.GetRealRow]) < StrToInt(frmCorrectCountForWriteOffSZ.edtCount.Text) then
            begin
             Application.MessageBox(PChar('Доступна кількість матеріала не повинна бути меншою за відкореговану кількість !'), PChar('Увага!'), MB_ICONWARNING);
             Exit;
            end;

            sgEstimateWriteOff.Cells[4,sgEstimateWriteOff.GetRealRow] := frmCorrectCountForWriteOffSZ.edtCount.Text;
         end;
      finally

          frmCorrectCountForWriteOffSZ.Free;
          frmCorrectCountForWriteOffSZ := nil;
      end;

end;

procedure TfrmFindMaterialForWriteOff.spbMolClick(Sender: TObject);
 var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
 i: Integer;
 molSel : boolean;
begin
  inherited;

//  TfrmFINMolShow.chooseFromListWithState(procedure(selectedObj : FINMolShort ) begin
//    {SUPP-64175 Сделаем возможность выбирать МОЛ
//    с которого были введены в эксплуатацию}
//    try
//            masterMOLCode := selectedObj.id;
//            masterMOLName := selectedObj.text;
//            edtMol.Text := masterMOLCode + ' ' + masterMOLName;
//            Self.OnShow(Sender);
//          except
//            on EConvertError do Exit;
//          end;
//        end);

        f := FINMolFilter.Create;
         SetNullXSProps(f);
         SetNullIntProps(f);
         f.state := 1;

     

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal);
   frmFINMolShow.visiblestate:= True;
   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               masterMOLCode := GetReturnValue(sgFINMol,0);
               masterMOLName := GetReturnValue(sgFINMol,1);
               edtMol.Text := masterMOLCode + ' ' + masterMOLName;
               Self.OnShow(Sender);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

end.
