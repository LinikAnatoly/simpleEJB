
unit ShowENFuelDistributionSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuelDistributionSheetController, AdvObj ;


type
  TfrmENFuelDistributionSheetShow = class(TChildForm)  
  HTTPRIOENFuelDistributionSheet: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelDistributionSheet: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENFuelDistributionSheetTopLeftChanged(Sender: TObject);
procedure sgENFuelDistributionSheetDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENFuelDistributionSheetObj: ENFuelDistributionSheet;
 // ENFuelDistributionSheetFilterObj: ENFuelDistributionSheetFilter;
  
  
implementation

uses Main, EditENFuelDistributionSheet, EditENFuelDistributionSheetFilter;


{$R *.dfm}

var
  //frmENFuelDistributionSheetShow : TfrmENFuelDistributionSheetShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelDistributionSheetHeaders: array [1..14] of String =
        ( 'Код'
          ,'Месяц финансирования'
          ,'Год финансирования'
          ,'Всього сумма з ПДВ, грн.'
          ,'Затверджена сума для фінансування палива по послугах на сторону'
          ,'Затверджена сума для фінансування палива по роботах'
          ,'Затверджена сума для фінансування ВКБ (Інвест программа)'
          ,'Затверджена сума для фінансування ВКБ (Інше)'
          ,'Затверджена сума для фінансування Приєднання'
          ,'Затверджена сума для фінансування Аварійного запасу'
          ,'Затверджена сума для фінансування ОВБ'
          ,'Тип палива'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENFuelDistributionSheetShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuelDistributionSheetShow:=nil;
    inherited;
  end;


procedure TfrmENFuelDistributionSheetShow.FormShow(Sender: TObject);
var
  TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort;
  i: Integer;
  ENFuelDistributionSheetList: ENFuelDistributionSheetShortList;
  begin
  SetGridHeaders(ENFuelDistributionSheetHeaders, sgENFuelDistributionSheet.ColumnHeaders);
  ColCount:=100;
  TempENFuelDistributionSheet :=  HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelDistributionSheetFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

   ENFuelDistributionSheetFilter(FilterObject).orderBySQL := ' enfueldistributionshet.dateedit desc, enfueldistributionshet.CODE desc ';


  ENFuelDistributionSheetList := TempENFuelDistributionSheet.getScrollableFilteredList(ENFuelDistributionSheetFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuelDistributionSheetList.list);

  if LastCount > -1 then
     sgENFuelDistributionSheet.RowCount:=LastCount+2
  else
     sgENFuelDistributionSheet.RowCount:=2;

   with sgENFuelDistributionSheet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelDistributionSheetList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelDistributionSheetList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENFuelDistributionSheetList.list[i].monthGen = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENFuelDistributionSheetList.list[i].monthGen);
        if ENFuelDistributionSheetList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENFuelDistributionSheetList.list[i].yearGen);
        if ENFuelDistributionSheetList.list[i].totalSum = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENFuelDistributionSheetList.list[i].totalSum.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum1 = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENFuelDistributionSheetList.list[i].sum1.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum2 = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENFuelDistributionSheetList.list[i].sum2.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum3 = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENFuelDistributionSheetList.list[i].sum3.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum4 = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENFuelDistributionSheetList.list[i].sum4.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum5 = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENFuelDistributionSheetList.list[i].sum5.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum6 = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENFuelDistributionSheetList.list[i].sum6.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum7 = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENFuelDistributionSheetList.list[i].sum7.DecimalString;

        Cells[11, i + 1] := ENFuelDistributionSheetList.list[i].fuelTypeRefName;

        Cells[12,i+1] := ENFuelDistributionSheetList.list[i].userGen;

        if ENFuelDistributionSheetList.list[i].dateEdit = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := XSDateTimeWithDate2String(ENFuelDistributionSheetList.list[i].dateEdit);
        LastRow:=i+1;
        sgENFuelDistributionSheet.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFuelDistributionSheet.Row:=1;
end;

procedure TfrmENFuelDistributionSheetShow.sgENFuelDistributionSheetTopLeftChanged(Sender: TObject);
var
  TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelDistributionSheetList: ENFuelDistributionSheetShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelDistributionSheet.TopRow + sgENFuelDistributionSheet.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelDistributionSheet :=  HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;
      CurrentRow:=sgENFuelDistributionSheet.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelDistributionSheetFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelDistributionSheetList := TempENFuelDistributionSheet.getScrollableFilteredList(ENFuelDistributionSheetFilter(FilterObject),ColCount-1, 100);



  sgENFuelDistributionSheet.RowCount:=sgENFuelDistributionSheet.RowCount+100;
  LastCount:=High(ENFuelDistributionSheetList.list);
  with sgENFuelDistributionSheet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelDistributionSheetList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelDistributionSheetList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENFuelDistributionSheetList.list[i].monthGen = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENFuelDistributionSheetList.list[i].monthGen);
        if ENFuelDistributionSheetList.list[i].yearGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENFuelDistributionSheetList.list[i].yearGen);
        if ENFuelDistributionSheetList.list[i].totalSum = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENFuelDistributionSheetList.list[i].totalSum.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum1 = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENFuelDistributionSheetList.list[i].sum1.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum2 = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENFuelDistributionSheetList.list[i].sum2.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum3 = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENFuelDistributionSheetList.list[i].sum3.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum4 = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENFuelDistributionSheetList.list[i].sum4.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum5 = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENFuelDistributionSheetList.list[i].sum5.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum6 = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENFuelDistributionSheetList.list[i].sum6.DecimalString;
        if ENFuelDistributionSheetList.list[i].sum7 = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENFuelDistributionSheetList.list[i].sum7.DecimalString;

        Cells[11, i + CurrentRow] := ENFuelDistributionSheetList.list[i].fuelTypeRefName;

        Cells[12,i+CurrentRow] := ENFuelDistributionSheetList.list[i].userGen;

        if ENFuelDistributionSheetList.list[i].dateEdit = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelDistributionSheetList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelDistributionSheet.Row:=CurrentRow-5;
   sgENFuelDistributionSheet.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelDistributionSheetShow.sgENFuelDistributionSheetDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelDistributionSheet,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuelDistributionSheetShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuelDistributionSheet.RowCount-1 do
   for j:=0 to sgENFuelDistributionSheet.ColCount-1 do
     sgENFuelDistributionSheet.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuelDistributionSheetShow.actViewExecute(Sender: TObject);
Var TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort;
begin
 TempENFuelDistributionSheet := HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;
   try
     ENFuelDistributionSheetObj := TempENFuelDistributionSheet.getObject(StrToInt(sgENFuelDistributionSheet.Cells[0,sgENFuelDistributionSheet.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelDistributionSheetEdit:=TfrmENFuelDistributionSheetEdit.Create(Application, dsView);
  try
    frmENFuelDistributionSheetEdit.ShowModal;
  finally
    frmENFuelDistributionSheetEdit.Free;
    frmENFuelDistributionSheetEdit:=nil;
  end;
end;

procedure TfrmENFuelDistributionSheetShow.actEditExecute(Sender: TObject);
Var TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort;
begin
 TempENFuelDistributionSheet := HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;
   try
     ENFuelDistributionSheetObj := TempENFuelDistributionSheet.getObject(StrToInt(sgENFuelDistributionSheet.Cells[0,sgENFuelDistributionSheet.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelDistributionSheetEdit:=TfrmENFuelDistributionSheetEdit.Create(Application, dsEdit);
  try
    if frmENFuelDistributionSheetEdit.ShowModal= mrOk then
      begin
        //TempENFuelDistributionSheet.save(ENFuelDistributionSheetObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelDistributionSheetEdit.Free;
    frmENFuelDistributionSheetEdit:=nil;
  end;
end;

procedure TfrmENFuelDistributionSheetShow.actDeleteExecute(Sender: TObject);
Var TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelDistributionSheet := HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelDistributionSheet.Cells[0,sgENFuelDistributionSheet.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відомість видачі палива (затверджені обсяги)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelDistributionSheet.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelDistributionSheetShow.actInsertExecute(Sender: TObject);
// Var TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort; 
begin
  // TempENFuelDistributionSheet := HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelDistributionSheetObj:=ENFuelDistributionSheet.Create;

   //ENFuelDistributionSheetObj.totalSum:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum1:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum2:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum3:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum4:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum5:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum1dec1:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum2dec1:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum3dec1:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum4dec1:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum5dec1:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum1dec2:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum2dec2:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum3dec2:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum4dec2:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum5dec2:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum1dec3:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum2dec3:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum3dec3:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum4dec3:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.sum5dec3:= TXSDecimal.Create;
   //ENFuelDistributionSheetObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENFuelDistributionSheetEdit:=TfrmENFuelDistributionSheetEdit.Create(Application, dsInsert);
    try
      if frmENFuelDistributionSheetEdit.ShowModal = mrOk then
      begin
        if ENFuelDistributionSheetObj<>nil then
            //TempENFuelDistributionSheet.add(ENFuelDistributionSheetObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelDistributionSheetEdit.Free;
      frmENFuelDistributionSheetEdit:=nil;
    end;
  finally
    ENFuelDistributionSheetObj.Free;
  end;
end;

procedure TfrmENFuelDistributionSheetShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuelDistributionSheetShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelDistributionSheetFilterEdit:=TfrmENFuelDistributionSheetFilterEdit.Create(Application, dsInsert);
  try
    ENFuelDistributionSheetFilterObj := ENFuelDistributionSheetFilter.Create;
    SetNullIntProps(ENFuelDistributionSheetFilterObj);
    SetNullXSProps(ENFuelDistributionSheetFilterObj);

    if frmENFuelDistributionSheetFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuelDistributionSheetFilter.Create;
      FilterObject := ENFuelDistributionSheetFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelDistributionSheetFilterEdit.Free;
    frmENFuelDistributionSheetFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuelDistributionSheetShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.