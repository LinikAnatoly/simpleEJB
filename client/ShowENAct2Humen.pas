
unit ShowENAct2Humen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAct2HumenController ;


type
  TfrmENAct2HumenShow = class(TChildForm)  
  HTTPRIOENAct2Humen: THTTPRIO;
    ImageList1: TImageList;
    sgENAct2Humen: TAdvStringGrid;
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
procedure sgENAct2HumenTopLeftChanged(Sender: TObject);
procedure sgENAct2HumenDblClick(Sender: TObject);
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
 // ENAct2HumenObj: ENAct2Humen;
 // ENAct2HumenFilterObj: ENAct2HumenFilter;
  
  
implementation

uses Main, EditENAct2Humen, EditENAct2HumenFilter;


{$R *.dfm}

var
  //frmENAct2HumenShow : TfrmENAct2HumenShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAct2HumenHeaders: array [1..11] of String =
        ( 'Код'
          ,'№ по порядку'
          ,'таб №'
          ,'ФИО/должность'
          ,'оклад в мес'
          ,'часов в мес'
          ,'зп в час'
          ,'часов отработано фактически'
          ,'часов отработано фактически на об_єкті'
          ,'час на доставку'
          ,'Зарплата'
        );
   

procedure TfrmENAct2HumenShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAct2HumenShow:=nil;
    inherited;
  end;


procedure TfrmENAct2HumenShow.FormShow(Sender: TObject);
var
  TempENAct2Humen: ENAct2HumenControllerSoapPort;
  i: Integer;
  ENAct2HumenList: ENAct2HumenShortList;
  begin
  SetGridHeaders(ENAct2HumenHeaders, sgENAct2Humen.ColumnHeaders);
  ColCount:=100;
  TempENAct2Humen :=  HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2HumenFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2HumenList := TempENAct2Humen.getScrollableFilteredList(ENAct2HumenFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAct2HumenList.list);

  if LastCount > -1 then
     sgENAct2Humen.RowCount:=LastCount+2
  else
     sgENAct2Humen.RowCount:=2;

   with sgENAct2Humen do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2HumenList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAct2HumenList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENAct2HumenList.list[i].orederNum = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENAct2HumenList.list[i].orederNum);
        Cells[2,i+1] := ENAct2HumenList.list[i].tabNumber;
        Cells[3,i+1] := ENAct2HumenList.list[i].fio;
        if ENAct2HumenList.list[i].salary = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENAct2HumenList.list[i].salary.DecimalString;
        if ENAct2HumenList.list[i].timeMonth = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENAct2HumenList.list[i].timeMonth.DecimalString;
        if ENAct2HumenList.list[i].salaryHours = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENAct2HumenList.list[i].salaryHours.DecimalString;
        if ENAct2HumenList.list[i].timeWork = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENAct2HumenList.list[i].timeWork.DecimalString;
        if ENAct2HumenList.list[i].timeObjectWork = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENAct2HumenList.list[i].timeObjectWork.DecimalString;
        if ENAct2HumenList.list[i].timeDelivery = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENAct2HumenList.list[i].timeDelivery.DecimalString;
        if ENAct2HumenList.list[i].paysWork = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENAct2HumenList.list[i].paysWork.DecimalString;
        LastRow:=i+1;
        sgENAct2Humen.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAct2Humen.Row:=1;
end;

procedure TfrmENAct2HumenShow.sgENAct2HumenTopLeftChanged(Sender: TObject);
var
  TempENAct2Humen: ENAct2HumenControllerSoapPort;
  i,CurrentRow: Integer;
  ENAct2HumenList: ENAct2HumenShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAct2Humen.TopRow + sgENAct2Humen.VisibleRowCount) = ColCount
  then
    begin
      TempENAct2Humen :=  HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;
      CurrentRow:=sgENAct2Humen.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2HumenFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2HumenList := TempENAct2Humen.getScrollableFilteredList(ENAct2HumenFilter(FilterObject),ColCount-1, 100);



  sgENAct2Humen.RowCount:=sgENAct2Humen.RowCount+100;
  LastCount:=High(ENAct2HumenList.list);
  with sgENAct2Humen do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2HumenList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAct2HumenList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENAct2HumenList.list[i].orederNum = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENAct2HumenList.list[i].orederNum);
        Cells[2,i+CurrentRow] := ENAct2HumenList.list[i].tabNumber;
        Cells[3,i+CurrentRow] := ENAct2HumenList.list[i].fio;
        if ENAct2HumenList.list[i].salary = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENAct2HumenList.list[i].salary.DecimalString;
        if ENAct2HumenList.list[i].timeMonth = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENAct2HumenList.list[i].timeMonth.DecimalString;
        if ENAct2HumenList.list[i].salaryHours = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENAct2HumenList.list[i].salaryHours.DecimalString;
        if ENAct2HumenList.list[i].timeWork = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENAct2HumenList.list[i].timeWork.DecimalString;
        if ENAct2HumenList.list[i].timeObjectWork = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENAct2HumenList.list[i].timeObjectWork.DecimalString;
        if ENAct2HumenList.list[i].timeDelivery = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENAct2HumenList.list[i].timeDelivery.DecimalString;
        if ENAct2HumenList.list[i].paysWork = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENAct2HumenList.list[i].paysWork.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAct2Humen.Row:=CurrentRow-5;
   sgENAct2Humen.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAct2HumenShow.sgENAct2HumenDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAct2Humen,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAct2HumenShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAct2Humen.RowCount-1 do
   for j:=0 to sgENAct2Humen.ColCount-1 do
     sgENAct2Humen.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAct2HumenShow.actViewExecute(Sender: TObject);
Var TempENAct2Humen: ENAct2HumenControllerSoapPort;
begin
 TempENAct2Humen := HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;
   try
     ENAct2HumenObj := TempENAct2Humen.getObject(StrToInt(sgENAct2Humen.Cells[0,sgENAct2Humen.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2HumenEdit:=TfrmENAct2HumenEdit.Create(Application, dsView);
  try
    frmENAct2HumenEdit.ShowModal;
  finally
    frmENAct2HumenEdit.Free;
    frmENAct2HumenEdit:=nil;
  end;
end;

procedure TfrmENAct2HumenShow.actEditExecute(Sender: TObject);
Var TempENAct2Humen: ENAct2HumenControllerSoapPort;
begin
 TempENAct2Humen := HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;
   try
     ENAct2HumenObj := TempENAct2Humen.getObject(StrToInt(sgENAct2Humen.Cells[0,sgENAct2Humen.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2HumenEdit:=TfrmENAct2HumenEdit.Create(Application, dsEdit);
  try
    if frmENAct2HumenEdit.ShowModal= mrOk then
      begin
        //TempENAct2Humen.save(ENAct2HumenObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAct2HumenEdit.Free;
    frmENAct2HumenEdit:=nil;
  end;
end;

procedure TfrmENAct2HumenShow.actDeleteExecute(Sender: TObject);
Var TempENAct2Humen: ENAct2HumenControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAct2Humen := HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAct2Humen.Cells[0,sgENAct2Humen.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (строки акта - люди) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAct2Humen.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAct2HumenShow.actInsertExecute(Sender: TObject);
Var TempENAct2Humen: ENAct2HumenControllerSoapPort;
begin
  TempENAct2Humen := HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;
  ENAct2HumenObj:=ENAct2Humen.Create;

   //ENAct2HumenObj.salary:= TXSDecimal.Create;
   //ENAct2HumenObj.timeMonth:= TXSDecimal.Create;
   //ENAct2HumenObj.salaryHours:= TXSDecimal.Create;
   //ENAct2HumenObj.timeWork:= TXSDecimal.Create;
   //ENAct2HumenObj.timeObjectWork:= TXSDecimal.Create;
   //ENAct2HumenObj.timeDelivery:= TXSDecimal.Create;
   //ENAct2HumenObj.paysWork:= TXSDecimal.Create;


  try
    frmENAct2HumenEdit:=TfrmENAct2HumenEdit.Create(Application, dsInsert);
    try
      if frmENAct2HumenEdit.ShowModal = mrOk then
      begin
        if ENAct2HumenObj<>nil then
            //TempENAct2Humen.add(ENAct2HumenObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAct2HumenEdit.Free;
      frmENAct2HumenEdit:=nil;
    end;
  finally
    ENAct2HumenObj.Free;
  end;
end;

procedure TfrmENAct2HumenShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAct2HumenShow.actFilterExecute(Sender: TObject);
begin
{frmENAct2HumenFilterEdit:=TfrmENAct2HumenFilterEdit.Create(Application, dsInsert);
  try
    ENAct2HumenFilterObj := ENAct2HumenFilter.Create;
    SetNullIntProps(ENAct2HumenFilterObj);
    SetNullXSProps(ENAct2HumenFilterObj);

    if frmENAct2HumenFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAct2HumenFilter.Create;
      FilterObject := ENAct2HumenFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAct2HumenFilterEdit.Free;
    frmENAct2HumenFilterEdit:=nil;
  end;}
end;

procedure TfrmENAct2HumenShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.