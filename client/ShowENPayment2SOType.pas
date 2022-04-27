
unit ShowENPayment2SOType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPayment2SOTypeController, AdvObj ;


type
  TfrmENPayment2SOTypeShow = class(TChildForm)  
  HTTPRIOENPayment2SOType: THTTPRIO;
    ImageList1: TImageList;
    sgENPayment2SOType: TAdvStringGrid;
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
procedure sgENPayment2SOTypeTopLeftChanged(Sender: TObject);
procedure sgENPayment2SOTypeDblClick(Sender: TObject);
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

var
 frmENPayment2SOTypeShow : TfrmENPayment2SOTypeShow;
 // ENPayment2SOTypeObj: ENPayment2SOType;
 // ENPayment2SOTypeFilterObj: ENPayment2SOTypeFilter;
  
  
implementation

uses Main, EditENPayment2SOType, EditENPayment2SOTypeFilter;


{$R *.dfm}

var
  //frmENPayment2SOTypeShow : TfrmENPayment2SOTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPayment2SOTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENPayment2SOTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPayment2SOTypeShow:=nil;
    inherited;
  end;


procedure TfrmENPayment2SOTypeShow.FormShow(Sender: TObject);
var
  TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
  i: Integer;
  ENPayment2SOTypeList: ENPayment2SOTypeShortList;
  begin
  SetGridHeaders(ENPayment2SOTypeHeaders, sgENPayment2SOType.ColumnHeaders);
  ColCount:=100;
  TempENPayment2SOType :=  HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPayment2SOTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;


  ENPayment2SOTypeList := TempENPayment2SOType.getScrollableFilteredList(ENPayment2SOTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPayment2SOTypeList.list);

  if LastCount > -1 then
     sgENPayment2SOType.RowCount:=LastCount+2
  else
     sgENPayment2SOType.RowCount:=2;

   with sgENPayment2SOType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPayment2SOTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPayment2SOTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPayment2SOTypeList.list[i].name;
        LastRow:=i+1;
        sgENPayment2SOType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPayment2SOType.Row:=1;
end;

procedure TfrmENPayment2SOTypeShow.sgENPayment2SOTypeTopLeftChanged(Sender: TObject);
var
  TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENPayment2SOTypeList: ENPayment2SOTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPayment2SOType.TopRow + sgENPayment2SOType.VisibleRowCount) = ColCount
  then
    begin
      TempENPayment2SOType :=  HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;
      CurrentRow:=sgENPayment2SOType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPayment2SOTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPayment2SOTypeList := TempENPayment2SOType.getScrollableFilteredList(ENPayment2SOTypeFilter(FilterObject),ColCount-1, 100);



  sgENPayment2SOType.RowCount:=sgENPayment2SOType.RowCount+100;
  LastCount:=High(ENPayment2SOTypeList.list);
  with sgENPayment2SOType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPayment2SOTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPayment2SOTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPayment2SOTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPayment2SOType.Row:=CurrentRow-5;
   sgENPayment2SOType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPayment2SOTypeShow.sgENPayment2SOTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPayment2SOType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPayment2SOTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPayment2SOType.RowCount-1 do
   for j:=0 to sgENPayment2SOType.ColCount-1 do
     sgENPayment2SOType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPayment2SOTypeShow.actViewExecute(Sender: TObject);
Var TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
begin
 TempENPayment2SOType := HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;
   try
     ENPayment2SOTypeObj := TempENPayment2SOType.getObject(StrToInt(sgENPayment2SOType.Cells[0,sgENPayment2SOType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPayment2SOTypeEdit:=TfrmENPayment2SOTypeEdit.Create(Application, dsView);
  try
    frmENPayment2SOTypeEdit.ShowModal;
  finally
    frmENPayment2SOTypeEdit.Free;
    frmENPayment2SOTypeEdit:=nil;
  end;
end;

procedure TfrmENPayment2SOTypeShow.actEditExecute(Sender: TObject);
Var TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
begin
 TempENPayment2SOType := HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;
   try
     ENPayment2SOTypeObj := TempENPayment2SOType.getObject(StrToInt(sgENPayment2SOType.Cells[0,sgENPayment2SOType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPayment2SOTypeEdit:=TfrmENPayment2SOTypeEdit.Create(Application, dsEdit);
  try
    if frmENPayment2SOTypeEdit.ShowModal= mrOk then
      begin
        //TempENPayment2SOType.save(ENPayment2SOTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPayment2SOTypeEdit.Free;
    frmENPayment2SOTypeEdit:=nil;
  end;
end;

procedure TfrmENPayment2SOTypeShow.actDeleteExecute(Sender: TObject);
Var TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPayment2SOType := HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPayment2SOType.Cells[0,sgENPayment2SOType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип оплат по послугам на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPayment2SOType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPayment2SOTypeShow.actInsertExecute(Sender: TObject);
// Var TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort; 
begin
  // TempENPayment2SOType := HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPayment2SOTypeObj:=ENPayment2SOType.Create;



  try
    frmENPayment2SOTypeEdit:=TfrmENPayment2SOTypeEdit.Create(Application, dsInsert);
    try
      if frmENPayment2SOTypeEdit.ShowModal = mrOk then
      begin
        if ENPayment2SOTypeObj<>nil then
            //TempENPayment2SOType.add(ENPayment2SOTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPayment2SOTypeEdit.Free;
      frmENPayment2SOTypeEdit:=nil;
    end;
  finally
    ENPayment2SOTypeObj.Free;
  end;
end;

procedure TfrmENPayment2SOTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPayment2SOTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENPayment2SOTypeFilterEdit:=TfrmENPayment2SOTypeFilterEdit.Create(Application, dsInsert);
  try
    ENPayment2SOTypeFilterObj := ENPayment2SOTypeFilter.Create;
    SetNullIntProps(ENPayment2SOTypeFilterObj);
		SetNullXSProps(ENPayment2SOTypeFilterObj);

		if frmENPayment2SOTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPayment2SOTypeFilter.Create;
			FilterObject := ENPayment2SOTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPayment2SOTypeFilterEdit.Free;
    frmENPayment2SOTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENPayment2SOTypeShow.actNoFilterExecute(Sender: TObject);
begin
	FilterObject.Free;
	FilterObject := nil;
  UpdateGrid(Sender);
end;

end.