
unit ShowENSOTechParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSOTechParamsController ;


type
    TfrmENSOTechParamsShow = class(TChildForm)  
    HTTPRIOENSOTechParams: THTTPRIO;
    ImageList1: TImageList;
    sgENSOTechParams: TAdvStringGrid;
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
    procedure sgENSOTechParamsTopLeftChanged(Sender: TObject);
    procedure sgENSOTechParamsDblClick(Sender: TObject);
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
 // ENSOTechParamsObj: ENSOTechParams;
 // ENSOTechParamsFilterObj: ENSOTechParamsFilter;
  
  
implementation

uses Main, EditENSOTechParams, EditENSOTechParamsFilter;


{$R *.dfm}

var
  frmENSOTechParamsShow : TfrmENSOTechParamsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOTechParamsHeaders: array [1..3] of String =
        ( 'Код'
          ,'Відстань до найближчої точки мереж'
          ,'Користувач, який вніс зміни'
        );
   

procedure TfrmENSOTechParamsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSOTechParamsShow:=nil;
  inherited;
end;


procedure TfrmENSOTechParamsShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSOTechParamsShow.FormShow(Sender: TObject);
var
  TempENSOTechParams: ENSOTechParamsControllerSoapPort;
  i: Integer;
  ENSOTechParamsList: ENSOTechParamsShortList;
begin
  SetGridHeaders(ENSOTechParamsHeaders, sgENSOTechParams.ColumnHeaders);
  ColCount:=100;
  TempENSOTechParams :=  HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOTechParamsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOTechParamsList := TempENSOTechParams.getScrollableFilteredList(ENSOTechParamsFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSOTechParamsList.list);

  if LastCount > -1 then
     sgENSOTechParams.RowCount:=LastCount+2
  else
     sgENSOTechParams.RowCount:=2;

   with sgENSOTechParams do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOTechParamsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOTechParamsList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENSOTechParamsList.list[i].closestDistance = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSOTechParamsList.list[i].closestDistance);
        Cells[2,i+1] := ENSOTechParamsList.list[i].userGen;
        LastRow:=i+1;
        sgENSOTechParams.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSOTechParams.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSOTechParams.RowCount > selectedRow then
      sgENSOTechParams.Row := selectedRow
    else
      sgENSOTechParams.Row := sgENSOTechParams.RowCount - 1;
    end
    else
      sgENSOTechParams.Row:=1;   
end;


procedure TfrmENSOTechParamsShow.sgENSOTechParamsTopLeftChanged(Sender: TObject);
var
  TempENSOTechParams: ENSOTechParamsControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOTechParamsList: ENSOTechParamsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOTechParams.TopRow + sgENSOTechParams.VisibleRowCount) = ColCount
  then
    begin
      TempENSOTechParams :=  HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;
      CurrentRow:=sgENSOTechParams.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOTechParamsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOTechParamsList := TempENSOTechParams.getScrollableFilteredList(ENSOTechParamsFilter(FilterObject),ColCount-1, 100);


  sgENSOTechParams.RowCount:=sgENSOTechParams.RowCount+100;
  LastCount:=High(ENSOTechParamsList.list);
  with sgENSOTechParams do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOTechParamsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOTechParamsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENSOTechParamsList.list[i].closestDistance = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENSOTechParamsList.list[i].closestDistance);
        Cells[2,i+CurrentRow] := ENSOTechParamsList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOTechParams.Row:=CurrentRow-5;
   sgENSOTechParams.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOTechParamsShow.sgENSOTechParamsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOTechParams,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSOTechParamsShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSOTechParams.RowCount-1 do
   for j:=0 to sgENSOTechParams.ColCount-1 do
     sgENSOTechParams.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSOTechParamsShow.actViewExecute(Sender: TObject);
var 
  TempENSOTechParams: ENSOTechParamsControllerSoapPort;
begin
  TempENSOTechParams := HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;
  try
    ENSOTechParamsObj := TempENSOTechParams.getObject(StrToInt(sgENSOTechParams.Cells[0,sgENSOTechParams.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOTechParams.Row;
  frmENSOTechParamsEdit:=TfrmENSOTechParamsEdit.Create(Application, dsView);
  
  try
    frmENSOTechParamsEdit.ShowModal;
  finally
    frmENSOTechParamsEdit.Free;
    frmENSOTechParamsEdit:=nil;
  end;

  if sgENSOTechParams.RowCount > selectedRow then
    sgENSOTechParams.Row := selectedRow
  else
    sgENSOTechParams.Row := sgENSOTechParams.RowCount - 1;
  
end;


procedure TfrmENSOTechParamsShow.actEditExecute(Sender: TObject);
var 
  TempENSOTechParams: ENSOTechParamsControllerSoapPort;
begin
  TempENSOTechParams := HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;
  try
    ENSOTechParamsObj := TempENSOTechParams.getObject(StrToInt(sgENSOTechParams.Cells[0,sgENSOTechParams.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOTechParams.Row;
  frmENSOTechParamsEdit:=TfrmENSOTechParamsEdit.Create(Application, dsEdit);
  
  try
    if frmENSOTechParamsEdit.ShowModal= mrOk then
      begin
        //TempENSOTechParams.save(ENSOTechParamsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOTechParamsEdit.Free;
    frmENSOTechParamsEdit:=nil;
  end;

  if sgENSOTechParams.RowCount > selectedRow then
    sgENSOTechParams.Row := selectedRow
  else
    sgENSOTechParams.Row := sgENSOTechParams.RowCount - 1;
  
end;


procedure TfrmENSOTechParamsShow.actDeleteExecute(Sender: TObject);
Var TempENSOTechParams: ENSOTechParamsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOTechParams := HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOTechParams.Cells[0,sgENSOTechParams.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Технические параметры ServicesObject''а) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOTechParams.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOTechParamsShow.actInsertExecute(Sender: TObject);
// Var TempENSOTechParams: ENSOTechParamsControllerSoapPort; 
begin
  // TempENSOTechParams := HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOTechParamsObj:=ENSOTechParams.Create;
  SetNullIntProps(ENSOTechParamsObj);
  SetNullXSProps(ENSOTechParamsObj);



  try
    frmENSOTechParamsEdit:=TfrmENSOTechParamsEdit.Create(Application, dsInsert);
    try
      if frmENSOTechParamsEdit.ShowModal = mrOk then
      begin
        if ENSOTechParamsObj<>nil then
            //TempENSOTechParams.add(ENSOTechParamsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOTechParamsEdit.Free;
      frmENSOTechParamsEdit:=nil;
    end;
  finally
    ENSOTechParamsObj.Free;
  end;
end;


procedure TfrmENSOTechParamsShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSOTechParamsShow.actFilterExecute(Sender: TObject);
begin
{frmENSOTechParamsFilterEdit:=TfrmENSOTechParamsFilterEdit.Create(Application, dsInsert);
  try
    ENSOTechParamsFilterObj := ENSOTechParamsFilter.Create;
    SetNullIntProps(ENSOTechParamsFilterObj);
    SetNullXSProps(ENSOTechParamsFilterObj);

    if frmENSOTechParamsFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSOTechParamsFilter.Create;
      FilterObject := ENSOTechParamsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOTechParamsFilterEdit.Free;
    frmENSOTechParamsFilterEdit:=nil;
  end;}
end;


procedure TfrmENSOTechParamsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.