
unit EditFKTrans2AXTrans;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FKTrans2AXTransController, AdvObj ;

type
  TfrmFKTrans2AXTransEdit = class(TDialogForm)

    lblCode : TLabel;
	edtCode : TEdit;
    lblMonthGen : TLabel;
    lblYearGen : TLabel;
    lblTaskOwner : TLabel;
    edtTaskOwner: TEdit;


  HTTPRIOFKTrans2AXTrans: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    Button1: TButton;
    PageControl1: TPageControl;
    TransGroup: TTabSheet;
    TransItem: TTabSheet;
    sgFKTrans2AXTransItemGroup: TAdvStringGrid;
    sgFKTrans2AXTransItem: TAdvStringGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actMakeDimension: TAction;
    PopupMenu1: TPopupMenu;
    ppMakeDimension: TMenuItem;
    HTTPRIOFKTrans2AXTransItem: THTTPRIO;
    actMoveTrans2AX: TAction;
    miMoveTrans2AX: TMenuItem;
    actExportTrans2AX: TAction;
    miExportTrans2AX: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure AddFKTrans2EN();
  procedure Button1Click(Sender: TObject);
  procedure updateTransGroup(Sender: TObject);
  procedure updateTransItem(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure actMakeDimensionExecute(Sender: TObject);
    procedure actMoveTrans2AXExecute(Sender: TObject);
    procedure actExportTrans2AXExecute(Sender: TObject);

  private
    { Private declarations }
    selectedItemIndex: Integer;
  public
    { Public declarations }

end;

var
  frmFKTrans2AXTransEdit: TfrmFKTrans2AXTransEdit;
  FKTrans2AXTransObj: FKTrans2AXTrans;

  FKTrans2AXTransItemHeadersGroup: array [1..3] of String =
        ( ' '
          ,'Дата проводки'
          ,'Кількість'
        );

          FKTrans2AXTransItemHeaders: array [1..46] of String =
        ( 'Код'
          ,'строка с уникальными номерами проводок FK'
          ,'Пачка проводок (ставится для приходов, они групируются еще и пачке проводок)'
          ,'проводки по приходам(0-нет,1-да)'
          ,'дата проводки'
          ,'Бал. цех'
          ,'Бал. счет'
          ,'Бал. кау'
          ,'Корр. цех'
          ,'Корр. счет'
          ,'Корр. кау'
          ,'Сумма в валюте'
          ,'Валюта'
          ,'Сумма без НДС в гривне'
          ,'Счёт(дебет)'
          ,'Корр. Счёт(кредет)'
          ,'Ан1.Подр.'
          ,'Ан2.Центр затр'
          ,'Ан3.Цель'
          ,'Ан4.Счет'
          ,'Ан5.Дог.'
          ,'Ан6.ЦФО'
          ,'Ан7.ФР'
          ,'Ан8.ДДС'
          ,'Ан9.Назначение'
          ,'Ан10.Основание'
          ,'Ан11.Док-осн.'
          ,'Ан12.Осн-средство'
          ,'Ан13.Присоединение'
          ,'Ан-кор1.Подр.'
          ,'Ан-кор2.Центр затр'
          ,'Ан-кор3.Цель'
          ,'Ан-кор4.Счет'
          ,'Ан-кор5.Дог.'
          ,'Ан-кор6.ЦФО'
          ,'Ан-кор7.ФР'
          ,'Ан-кор8.ДДС'
          ,'Ан-кор9.Назначение'
          ,'Ан-кор10.Основание'
          ,'Ан-кор11.Док-осн.'
          ,'Ан-кор12.Осн-средство'
          ,'Ан-кор13.Присоединение'
          ,'Текст проводки'
          ,'Код операции'
          ,'1 - новая 2- с ошибкой 3- проведеная'
          ,'текст ошибки '
        );

implementation

uses FKTrans2AXTransItemController;


{uses  
    EnergyproController, EnergyproController2, FKTrans2AXTransController  ;
}
{$R *.dfm}



procedure TfrmFKTrans2AXTransEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMonthGen
      ,edtYearGen
      ,edtTaskOwner
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(FKTrans2AXTransObj.code);

    edtTaskOwner.Text := FKTrans2AXTransObj.taskOwner;

    if ( FKTrans2AXTransObj.yearGen <> Low(Integer) ) then
       //edtYearGen.Text := IntToStr(ENPlanWorkObj.yearGen)
       edtYearGen.ItemIndex := FKTrans2AXTransObj.yearGen - 2009
    else
       //edtYearGen.Text := '';
       edtYearGen.ItemIndex := -1;
    if ( FKTrans2AXTransObj.monthGen <> Low(Integer) ) then
       //edtMonthGen.Text := IntToStr(ENPlanWorkObj.monthGen)
       edtMonthGen.ItemIndex := FKTrans2AXTransObj.monthGen - 1
    else
       //edtMonthGen.Text := '';
       edtMonthGen.ItemIndex := -1;

       updateTransGroup(Sender);

  end;
end;



procedure TfrmFKTrans2AXTransEdit.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage = TransGroup then
  begin
    updateTransGroup(Sender);
  end;
  if PageControl1.ActivePage = TransItem then
  begin
    updateTransItem(Sender);
  end;


end;

procedure TfrmFKTrans2AXTransEdit.Button1Click(Sender: TObject);
begin
  inherited;
      AddFKTrans2EN();
      updateTransGroup(Sender);
end;

procedure TfrmFKTrans2AXTransEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMonthGen
      ,edtYearGen
      ,edtTaskOwner
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFKTrans2AXTrans := HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;


     if (edtYearGen.ItemIndex >= 0) then
       FKTrans2AXTransObj.yearGen := edtYearGen.ItemIndex + 2009
     else
       FKTrans2AXTransObj.yearGen := Low(Integer) ;

     if (edtMonthGen.ItemIndex >= 0) then
       FKTrans2AXTransObj.monthGen := edtMonthGen.ItemIndex + 1
     else
       FKTrans2AXTransObj.monthGen := Low(Integer) ;

     FKTrans2AXTransObj.taskOwner := edtTaskOwner.Text;

    if DialogState = dsInsert then
    begin
      FKTrans2AXTransObj.code:=low(Integer);
      TempFKTrans2AXTrans.add(FKTrans2AXTransObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFKTrans2AXTrans.save(FKTrans2AXTransObj);
    end;
  end;
end;

procedure TfrmFKTrans2AXTransEdit.actExportTrans2AXExecute(Sender: TObject);
Var TempFKTrans2AXTransItem: FKTrans2AXTransItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempFKTrans2AXTransItem := HTTPRIOFKTrans2AXTransItem as FKTrans2AXTransItemControllerSoapPort;
  if (sgFKTrans2AXTransItemGroup.Cells[1,sgFKTrans2AXTransItemGroup.Row]) = '' then
     begin
       Application.MessageBox(PChar('Не обрана дата проводок !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
       exit;
     end;

  if Application.MessageBox(PChar('Бажаєте експортувати проводки в АХ )) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFKTrans2AXTransItem.exportTrans2AX(FKTrans2AXTransObj.code , sgFKTrans2AXTransItemGroup.Cells[1,sgFKTrans2AXTransItemGroup.Row] );
      updateTransGroup(Sender);

  end;
end;

procedure TfrmFKTrans2AXTransEdit.actMakeDimensionExecute(Sender: TObject);
Var TempFKTrans2AXTransItem: FKTrans2AXTransItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempFKTrans2AXTransItem := HTTPRIOFKTrans2AXTransItem as FKTrans2AXTransItemControllerSoapPort;
//   try
//     ObjCode := StrToInt(sgFKTrans2AXTransItem.Cells[0,sgFKTrans2AXTransItem.Row]);
//   except
//   on EConvertError do Exit;
//  end;
  if Application.MessageBox(PChar('Вы действительно хотите сформировать аналитики для проводок АХ )) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      selectedItemIndex := sgFKTrans2AXTransItemGroup.Row;
      TempFKTrans2AXTransItem.makeDimensionAX(FKTrans2AXTransObj.code , sgFKTrans2AXTransItemGroup.Cells[1,sgFKTrans2AXTransItemGroup.Row] );
      updateTransGroup(Sender);

      if  PageControl1.ActivePage = TransGroup then
      begin
        if sgFKTrans2AXTransItemGroup.RowCount > selectedItemIndex then
          sgFKTrans2AXTransItemGroup.Row := selectedItemIndex
        else
          sgFKTrans2AXTransItemGroup.Row := sgFKTrans2AXTransItemGroup.RowCount - 1;
      end;

  end;
end;

procedure TfrmFKTrans2AXTransEdit.actMoveTrans2AXExecute(Sender: TObject);
Var TempFKTrans2AXTransItem: FKTrans2AXTransItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempFKTrans2AXTransItem := HTTPRIOFKTrans2AXTransItem as FKTrans2AXTransItemControllerSoapPort;
  if (sgFKTrans2AXTransItemGroup.Cells[1,sgFKTrans2AXTransItemGroup.Row]) = '' then
     begin
       Application.MessageBox(PChar('Не обрана дата проводок !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
       exit;
     end;

  if Application.MessageBox(PChar('Бажаєте провести проводки в АХ )) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFKTrans2AXTransItem.moveTrans2AX(FKTrans2AXTransObj.code , sgFKTrans2AXTransItemGroup.Cells[1,sgFKTrans2AXTransItemGroup.Row] );
      updateTransGroup(Sender);

  end;
end;

procedure TfrmFKTrans2AXTransEdit.AddFKTrans2EN();
var TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
begin
    TempFKTrans2AXTrans := HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;

    if DialogState = dsEdit then
    begin
      TempFKTrans2AXTrans.addFKTrans2EN(FKTrans2AXTransObj.code);
    end;

end;

procedure TfrmFKTrans2AXTransEdit.updateTransGroup(Sender: TObject);
var
  TempFKTrans2AXTransItem: FKTrans2AXTransItemControllerSoapPort;
  i: Integer;
  FKTrans2AXTransItemList: FKTrans2AXTransItemShortList;
  itemFilterGroup : FKTrans2AXTransItemFilter;
  ColCount, LastCount , selectedRow : Integer;
  LastRow: Integer ;
begin
  selectedRow := 1;
  SetGridHeaders(FKTrans2AXTransItemHeadersGroup , sgFKTrans2AXTransItemGroup.ColumnHeaders);

  TempFKTrans2AXTransItem :=  HTTPRIOFKTrans2AXTransItem as FKTrans2AXTransItemControllerSoapPort;

     itemFilterGroup := FKTrans2AXTransItemFilter.Create;
     SetNullIntProps(itemFilterGroup);
     SetNullXSProps(itemFilterGroup);

  itemFilterGroup.FKTrans2AXTrans := FKTrans2AXTransRef.Create;
  itemFilterGroup.FKTrans2AXTrans.code := FKTrans2AXTransObj.code;

  //FKTrans2AXTransItemList := TempFKTrans2AXTransItem.getScrollableFilteredListGroup(FKTrans2AXTransItemFilter(itemFilterGroup),0,3000);
  FKTrans2AXTransItemList := TempFKTrans2AXTransItem.getScrollableFilteredListGroup(itemFilterGroup,0,3000);
  LastCount:=High(FKTrans2AXTransItemList.list);

  if LastCount > -1 then
     sgFKTrans2AXTransItemGroup.RowCount:=LastCount+2
  else
     sgFKTrans2AXTransItemGroup.RowCount:=2;

   with sgFKTrans2AXTransItemGroup do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if FKTrans2AXTransItemList.list[i].transDate = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(FKTrans2AXTransItemList.list[i].transDate);


        if FKTrans2AXTransItemList.list[i].code <> Low(Integer) then
        Cells[2,i+1] := IntToStr(FKTrans2AXTransItemList.list[i].code)
        else
        Cells[2,i+1] := '';



      end;

    ColCount:=ColCount+1;
    sgFKTrans2AXTransItemGroup.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgFKTrans2AXTransItemGroup.RowCount > selectedRow then
      sgFKTrans2AXTransItemGroup.Row := selectedRow
    else
      sgFKTrans2AXTransItemGroup.Row := sgFKTrans2AXTransItemGroup.RowCount - 1;
    end
    else
      sgFKTrans2AXTransItemGroup.Row:=1;
end;


procedure TfrmFKTrans2AXTransEdit.updateTransItem(Sender: TObject);
var
  TempFKTrans2AXTransItem: FKTrans2AXTransItemControllerSoapPort;
  i: Integer;
  FKTrans2AXTransItemList: FKTrans2AXTransItemShortList;
  itemFilter : FKTrans2AXTransItemFilter;
  ColCount, LastCount , selectedRow : Integer;
  LastRow: Integer ;
  groupItemDate : string;
begin
     SetGridHeaders(FKTrans2AXTransItemHeaders, sgFKTrans2AXTransItem.ColumnHeaders);
     ColCount:=5000;

     // строки разворачивать только по фильтру "дата" - из груп строки
     try
      groupItemDate := sgFKTrans2AXTransItemGroup.Cells[1,sgFKTrans2AXTransItemGroup.Row]
     except
      groupItemDate := '';
    end;

     if (groupItemDate <> '' ) then
     begin

           TempFKTrans2AXTransItem :=  HTTPRIOFKTrans2AXTransItem as FKTrans2AXTransItemControllerSoapPort;


           itemFilter := FKTrans2AXTransItemFilter.Create;
           SetNullIntProps(itemFilter);
           SetNullXSProps(itemFilter);

           itemFilter.FKTrans2AXTrans := FKTrans2AXTransRef.Create;
           itemFilter.FKTrans2AXTrans.code := FKTrans2AXTransObj.code;

//           ENPlanWorkObj.dateStart := TXSDate.Create;
 //         ENPlanWorkObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
           itemFilter.conditionSQL := ' FKTRANS2AXTRANSITEM.TRANSDATE = '''+ groupItemDate +''' ' ;

           FKTrans2AXTransItemList := TempFKTrans2AXTransItem.getScrollableFilteredList(FKTrans2AXTransItemFilter(itemFilter),0,ColCount);
           LastCount:=High(FKTrans2AXTransItemList.list);

        if LastCount > -1 then
           sgFKTrans2AXTransItem.RowCount:=LastCount+2
        else
           sgFKTrans2AXTransItem.RowCount:=2;

         with sgFKTrans2AXTransItem do
          for i:=0 to LastCount do
            begin
              Application.ProcessMessages;
              if FKTrans2AXTransItemList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(FKTrans2AXTransItemList.list[i].code)
              else
              Cells[0,i+1] := '';
              Cells[1,i+1] := FKTrans2AXTransItemList.list[i].numUnFKStr;
              if FKTrans2AXTransItemList.list[i].partId = Low(Integer) then
                Cells[2,i+1] := ''
              else
                Cells[2,i+1] := IntToStr(FKTrans2AXTransItemList.list[i].partId);
              if FKTrans2AXTransItemList.list[i].isPrihod = Low(Integer) then
                Cells[3,i+1] := ''
              else
                Cells[3,i+1] := IntToStr(FKTrans2AXTransItemList.list[i].isPrihod);
              if FKTrans2AXTransItemList.list[i].transDate = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDate2String(FKTrans2AXTransItemList.list[i].transDate);
              Cells[5,i+1] := FKTrans2AXTransItemList.list[i].balCeh;
              Cells[6,i+1] := FKTrans2AXTransItemList.list[i].balSch;
              Cells[7,i+1] := FKTrans2AXTransItemList.list[i].balKau;
              Cells[8,i+1] := FKTrans2AXTransItemList.list[i].korCeh;
              Cells[9,i+1] := FKTrans2AXTransItemList.list[i].korSch;
              Cells[10,i+1] := FKTrans2AXTransItemList.list[i].korKau;
              if FKTrans2AXTransItemList.list[i].amountCur = nil then
                Cells[11,i+1] := ''
              else
                Cells[11,i+1] := FKTrans2AXTransItemList.list[i].amountCur.DecimalString;
              Cells[12,i+1] := FKTrans2AXTransItemList.list[i].currency;
              if FKTrans2AXTransItemList.list[i].amountMST = nil then
                Cells[13,i+1] := ''
              else
                Cells[13,i+1] := FKTrans2AXTransItemList.list[i].amountMST.DecimalString;
              Cells[14,i+1] := FKTrans2AXTransItemList.list[i].accountNum;
              Cells[15,i+1] := FKTrans2AXTransItemList.list[i].offsetAccountNum;
              Cells[16,i+1] := FKTrans2AXTransItemList.list[i].accountDimension1;
              Cells[17,i+1] := FKTrans2AXTransItemList.list[i].accountDimension2;
              Cells[18,i+1] := FKTrans2AXTransItemList.list[i].accountDimension3;
              Cells[19,i+1] := FKTrans2AXTransItemList.list[i].accountDimension4;
              Cells[20,i+1] := FKTrans2AXTransItemList.list[i].accountDimension5;
              Cells[21,i+1] := FKTrans2AXTransItemList.list[i].accountDimension6;
              Cells[22,i+1] := FKTrans2AXTransItemList.list[i].accountDimension7;
              Cells[23,i+1] := FKTrans2AXTransItemList.list[i].accountDimension8;
              Cells[24,i+1] := FKTrans2AXTransItemList.list[i].accountDimension9;
              Cells[25,i+1] := FKTrans2AXTransItemList.list[i].accountDimension10;
              Cells[26,i+1] := FKTrans2AXTransItemList.list[i].accountDimension11;
              Cells[27,i+1] := FKTrans2AXTransItemList.list[i].accountDimension12;
              Cells[28,i+1] := FKTrans2AXTransItemList.list[i].accountDimension13;
              Cells[29,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension1;
              Cells[30,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension2;
              Cells[31,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension3;
              Cells[32,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension4;
              Cells[33,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension5;
              Cells[34,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension6;
              Cells[35,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension7;
              Cells[36,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension8;
              Cells[37,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension9;
              Cells[38,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension10;
              Cells[39,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension11;
              Cells[40,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension12;
              Cells[41,i+1] := FKTrans2AXTransItemList.list[i].corAccountDimension13;
              Cells[42,i+1] := FKTrans2AXTransItemList.list[i].ledgerTxt;
              Cells[43,i+1] := FKTrans2AXTransItemList.list[i].voucher;
              if FKTrans2AXTransItemList.list[i].status = Low(Integer) then
                Cells[44,i+1] := ''
              else
                Cells[44,i+1] := IntToStr(FKTrans2AXTransItemList.list[i].status);
              Cells[45,i+1] := FKTrans2AXTransItemList.list[i].errorStr;
              LastRow:=i+1;
              sgFKTrans2AXTransItem.RowCount:=LastRow+1;
            end;

          ColCount:=ColCount+1;
          sgFKTrans2AXTransItem.Row:=1;

          if selectedRow <> 0 then
          begin
          if sgFKTrans2AXTransItem.RowCount > selectedRow then
            sgFKTrans2AXTransItem.Row := selectedRow
          else
            sgFKTrans2AXTransItem.Row := sgFKTrans2AXTransItem.RowCount - 1;
          end
          else
            sgFKTrans2AXTransItem.Row:=1;
     end;
end;

end.