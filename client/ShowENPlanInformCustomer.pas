
unit ShowENPlanInformCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPlanInformCustomerController, AdvObj ;


type
    TfrmENPlanInformCustomerShow = class(TChildForm)  
    HTTPRIOENPlanInformCustomer: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanInformCustomer: TAdvStringGrid;
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
    procedure sgENPlanInformCustomerTopLeftChanged(Sender: TObject);
    procedure sgENPlanInformCustomerDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENPlanInformCustomerObj: ENPlanInformCustomer;
 // ENPlanInformCustomerFilterObj: ENPlanInformCustomerFilter;
  
  
implementation

uses Main, EditENPlanInformCustomer, EditENPlanInformCustomerFilter;


{$R *.dfm}

var
  //frmENPlanInformCustomerShow : TfrmENPlanInformCustomerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanInformCustomerHeaders: array [1..8] of String =
        ( 'Код'
          ,'Фактичний час виїзда з гаража'
          ,'Фактичний час повернення до гаражу'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
          ,'Отправлено уведомление'
        );
   

procedure TfrmENPlanInformCustomerShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPlanInformCustomerShow:=nil;
  inherited;
end;


procedure TfrmENPlanInformCustomerShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENPlanInformCustomerShow.FormShow(Sender: TObject);
var
  TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort;
  i: Integer;
  ENPlanInformCustomerList: ENPlanInformCustomerShortList;
begin
  SetGridHeaders(ENPlanInformCustomerHeaders, sgENPlanInformCustomer.ColumnHeaders);
  ColCount:=100;
  TempENPlanInformCustomer :=  HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanInformCustomerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanInformCustomerList := TempENPlanInformCustomer.getScrollableFilteredList(ENPlanInformCustomerFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPlanInformCustomerList.list);

  if LastCount > -1 then
     sgENPlanInformCustomer.RowCount:=LastCount+2
  else
     sgENPlanInformCustomer.RowCount:=2;

   with sgENPlanInformCustomer do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanInformCustomerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanInformCustomerList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanInformCustomerList.list[i].timeStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].timeStart);
        if ENPlanInformCustomerList.list[i].timeFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].timeFinal);
        Cells[3,i+1] := ENPlanInformCustomerList.list[i].userAdd;
        if ENPlanInformCustomerList.list[i].dateAdd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].dateAdd);
        Cells[5,i+1] := ENPlanInformCustomerList.list[i].userGen;
        if ENPlanInformCustomerList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].dateEdit);
        if ENPlanInformCustomerList.list[i].isSent = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENPlanInformCustomerList.list[i].isSent);
        LastRow:=i+1;
        sgENPlanInformCustomer.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPlanInformCustomer.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPlanInformCustomer.RowCount > selectedRow then
      sgENPlanInformCustomer.Row := selectedRow
    else
      sgENPlanInformCustomer.Row := sgENPlanInformCustomer.RowCount - 1;
    end
    else
      sgENPlanInformCustomer.Row:=1;   
end;


procedure TfrmENPlanInformCustomerShow.sgENPlanInformCustomerTopLeftChanged(Sender: TObject);
var
  TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanInformCustomerList: ENPlanInformCustomerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanInformCustomer.TopRow + sgENPlanInformCustomer.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanInformCustomer :=  HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;
      CurrentRow:=sgENPlanInformCustomer.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanInformCustomerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanInformCustomerList := TempENPlanInformCustomer.getScrollableFilteredList(ENPlanInformCustomerFilter(FilterObject),ColCount-1, 100);


  sgENPlanInformCustomer.RowCount:=sgENPlanInformCustomer.RowCount+100;
  LastCount:=High(ENPlanInformCustomerList.list);
  with sgENPlanInformCustomer do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanInformCustomerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanInformCustomerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPlanInformCustomerList.list[i].timeStart = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].timeStart);		  
        if ENPlanInformCustomerList.list[i].timeFinal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].timeFinal);		  
        Cells[3,i+CurrentRow] := ENPlanInformCustomerList.list[i].userAdd;
        if ENPlanInformCustomerList.list[i].dateAdd = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].dateAdd);		  
        Cells[5,i+CurrentRow] := ENPlanInformCustomerList.list[i].userGen;
        if ENPlanInformCustomerList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanInformCustomerList.list[i].dateEdit);		  
        if ENPlanInformCustomerList.list[i].isSent = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENPlanInformCustomerList.list[i].isSent);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanInformCustomer.Row:=CurrentRow-5;
   sgENPlanInformCustomer.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanInformCustomerShow.sgENPlanInformCustomerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanInformCustomer,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPlanInformCustomerShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENPlanInformCustomer.RowCount-1 do
   for j:=0 to sgENPlanInformCustomer.ColCount-1 do
     sgENPlanInformCustomer.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPlanInformCustomerShow.actViewExecute(Sender: TObject);
var 
  TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort;
begin
  TempENPlanInformCustomer := HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;
  try
    ENPlanInformCustomerObj := TempENPlanInformCustomer.getObject(StrToInt(sgENPlanInformCustomer.Cells[0,sgENPlanInformCustomer.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanInformCustomer.Row;
  frmENPlanInformCustomerEdit:=TfrmENPlanInformCustomerEdit.Create(Application, dsView);
  
  try
    frmENPlanInformCustomerEdit.ShowModal;
  finally
    frmENPlanInformCustomerEdit.Free;
    frmENPlanInformCustomerEdit:=nil;
  end;

  if sgENPlanInformCustomer.RowCount > selectedRow then
    sgENPlanInformCustomer.Row := selectedRow
  else
    sgENPlanInformCustomer.Row := sgENPlanInformCustomer.RowCount - 1;
  
end;


procedure TfrmENPlanInformCustomerShow.actEditExecute(Sender: TObject);
var 
  TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort;
begin
  TempENPlanInformCustomer := HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;
  try
    ENPlanInformCustomerObj := TempENPlanInformCustomer.getObject(StrToInt(sgENPlanInformCustomer.Cells[0,sgENPlanInformCustomer.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanInformCustomer.Row;
  frmENPlanInformCustomerEdit:=TfrmENPlanInformCustomerEdit.Create(Application, dsEdit);
  
  try
    if frmENPlanInformCustomerEdit.ShowModal= mrOk then
      begin
        //TempENPlanInformCustomer.save(ENPlanInformCustomerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanInformCustomerEdit.Free;
    frmENPlanInformCustomerEdit:=nil;
  end;

  if sgENPlanInformCustomer.RowCount > selectedRow then
    sgENPlanInformCustomer.Row := selectedRow
  else
    sgENPlanInformCustomer.Row := sgENPlanInformCustomer.RowCount - 1;
  
end;


procedure TfrmENPlanInformCustomerShow.actDeleteExecute(Sender: TObject);
Var TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanInformCustomer := HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanInformCustomer.Cells[0,sgENPlanInformCustomer.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Інформація для абонентів про виконання робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanInformCustomer.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanInformCustomerShow.actInsertExecute(Sender: TObject);
// Var TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort; 
begin
  // TempENPlanInformCustomer := HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanInformCustomerObj:=ENPlanInformCustomer.Create;
  SetNullIntProps(ENPlanInformCustomerObj);
  SetNullXSProps(ENPlanInformCustomerObj);

   //ENPlanInformCustomerObj.timeStart:= TXSDateTime.Create;
   
   //ENPlanInformCustomerObj.timeFinal:= TXSDateTime.Create;
   
   //ENPlanInformCustomerObj.dateAdd:= TXSDateTime.Create;
   
   //ENPlanInformCustomerObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENPlanInformCustomerEdit:=TfrmENPlanInformCustomerEdit.Create(Application, dsInsert);
    try
      if frmENPlanInformCustomerEdit.ShowModal = mrOk then
      begin
        if ENPlanInformCustomerObj<>nil then
            //TempENPlanInformCustomer.add(ENPlanInformCustomerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanInformCustomerEdit.Free;
      frmENPlanInformCustomerEdit:=nil;
    end;
  finally
    ENPlanInformCustomerObj.Free;
  end;
end;


procedure TfrmENPlanInformCustomerShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPlanInformCustomerShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanInformCustomerFilterEdit:=TfrmENPlanInformCustomerFilterEdit.Create(Application, dsInsert);
  try
    ENPlanInformCustomerFilterObj := ENPlanInformCustomerFilter.Create;
    SetNullIntProps(ENPlanInformCustomerFilterObj);
    SetNullXSProps(ENPlanInformCustomerFilterObj);

    if frmENPlanInformCustomerFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENPlanInformCustomerFilter.Create;
      FilterObject := ENPlanInformCustomerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanInformCustomerFilterEdit.Free;
    frmENPlanInformCustomerFilterEdit:=nil;
  end;}
end;


procedure TfrmENPlanInformCustomerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.