
unit ShowCNSubsystemType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  CNSubsystemTypeController ;


type
  TfrmCNSubsystemTypeShow = class(TChildForm)  
  HTTPRIOCNSubsystemType: THTTPRIO;
    ImageList1: TImageList;
    sgCNSubsystemType: TAdvStringGrid;
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
procedure sgCNSubsystemTypeTopLeftChanged(Sender: TObject);
procedure sgCNSubsystemTypeDblClick(Sender: TObject);
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
 // CNSubsystemTypeObj: CNSubsystemType;
 // CNSubsystemTypeFilterObj: CNSubsystemTypeFilter;
  
  
implementation

uses Main, EditCNSubsystemType, EditCNSubsystemTypeFilter;


{$R *.dfm}

var
  //frmCNSubsystemTypeShow : TfrmCNSubsystemTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  CNSubsystemTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Подсистемы цепочек'
        );
   

procedure TfrmCNSubsystemTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmCNSubsystemTypeShow:=nil;
    inherited;
  end;


procedure TfrmCNSubsystemTypeShow.FormShow(Sender: TObject);
var
  TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
  i: Integer;
  CNSubsystemTypeList: CNSubsystemTypeShortList;
  begin
  SetGridHeaders(CNSubsystemTypeHeaders, sgCNSubsystemType.ColumnHeaders);
  ColCount:=100;
  TempCNSubsystemType :=  HTTPRIOCNSubsystemType as CNSubsystemTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := CNSubsystemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  CNSubsystemTypeList := TempCNSubsystemType.getScrollableFilteredList(CNSubsystemTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(CNSubsystemTypeList.list);

  if LastCount > -1 then
     sgCNSubsystemType.RowCount:=LastCount+2
  else
     sgCNSubsystemType.RowCount:=2;

   with sgCNSubsystemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if CNSubsystemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(CNSubsystemTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := CNSubsystemTypeList.list[i].name;
        LastRow:=i+1;
        sgCNSubsystemType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgCNSubsystemType.Row:=1;
end;

procedure TfrmCNSubsystemTypeShow.sgCNSubsystemTypeTopLeftChanged(Sender: TObject);
var
  TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
  i,CurrentRow: Integer;
  CNSubsystemTypeList: CNSubsystemTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgCNSubsystemType.TopRow + sgCNSubsystemType.VisibleRowCount) = ColCount
  then
    begin
      TempCNSubsystemType :=  HTTPRIOCNSubsystemType as CNSubsystemTypeControllerSoapPort;
      CurrentRow:=sgCNSubsystemType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := CNSubsystemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  CNSubsystemTypeList := TempCNSubsystemType.getScrollableFilteredList(CNSubsystemTypeFilter(FilterObject),ColCount-1, 100);



  sgCNSubsystemType.RowCount:=sgCNSubsystemType.RowCount+100;
  LastCount:=High(CNSubsystemTypeList.list);
  with sgCNSubsystemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if CNSubsystemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(CNSubsystemTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := CNSubsystemTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgCNSubsystemType.Row:=CurrentRow-5;
   sgCNSubsystemType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmCNSubsystemTypeShow.sgCNSubsystemTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgCNSubsystemType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmCNSubsystemTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgCNSubsystemType.RowCount-1 do
   for j:=0 to sgCNSubsystemType.ColCount-1 do
     sgCNSubsystemType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmCNSubsystemTypeShow.actViewExecute(Sender: TObject);
Var TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
begin
 TempCNSubsystemType := HTTPRIOCNSubsystemType as CNSubsystemTypeControllerSoapPort;
   try
     CNSubsystemTypeObj := TempCNSubsystemType.getObject(StrToInt(sgCNSubsystemType.Cells[0,sgCNSubsystemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmCNSubsystemTypeEdit:=TfrmCNSubsystemTypeEdit.Create(Application, dsView);
  try
    frmCNSubsystemTypeEdit.ShowModal;
  finally
    frmCNSubsystemTypeEdit.Free;
    frmCNSubsystemTypeEdit:=nil;
  end;
end;

procedure TfrmCNSubsystemTypeShow.actEditExecute(Sender: TObject);
Var TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
begin
 TempCNSubsystemType := HTTPRIOCNSubsystemType as CNSubsystemTypeControllerSoapPort;
   try
     CNSubsystemTypeObj := TempCNSubsystemType.getObject(StrToInt(sgCNSubsystemType.Cells[0,sgCNSubsystemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmCNSubsystemTypeEdit:=TfrmCNSubsystemTypeEdit.Create(Application, dsEdit);
  try
    if frmCNSubsystemTypeEdit.ShowModal= mrOk then
      begin
        //TempCNSubsystemType.save(CNSubsystemTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmCNSubsystemTypeEdit.Free;
    frmCNSubsystemTypeEdit:=nil;
  end;
end;

procedure TfrmCNSubsystemTypeShow.actDeleteExecute(Sender: TObject);
Var TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempCNSubsystemType := HTTPRIOCNSubsystemType as CNSubsystemTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgCNSubsystemType.Cells[0,sgCNSubsystemType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Подсистемы цепочек) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempCNSubsystemType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmCNSubsystemTypeShow.actInsertExecute(Sender: TObject);
Var TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
begin
  TempCNSubsystemType := HTTPRIOCNSubsystemType as CNSubsystemTypeControllerSoapPort;
  CNSubsystemTypeObj:=CNSubsystemType.Create;



  try
    frmCNSubsystemTypeEdit:=TfrmCNSubsystemTypeEdit.Create(Application, dsInsert);
    try
      if frmCNSubsystemTypeEdit.ShowModal = mrOk then
      begin
        if CNSubsystemTypeObj<>nil then
            //TempCNSubsystemType.add(CNSubsystemTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmCNSubsystemTypeEdit.Free;
      frmCNSubsystemTypeEdit:=nil;
    end;
  finally
    CNSubsystemTypeObj.Free;
  end;
end;

procedure TfrmCNSubsystemTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmCNSubsystemTypeShow.actFilterExecute(Sender: TObject);
begin
{frmCNSubsystemTypeFilterEdit:=TfrmCNSubsystemTypeFilterEdit.Create(Application, dsEdit);
  try
    CNSubsystemTypeFilterObj := CNSubsystemTypeFilter.Create;
    SetNullIntProps(CNSubsystemTypeFilterObj);
    SetNullXSProps(CNSubsystemTypeFilterObj);

    if frmCNSubsystemTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := CNSubsystemTypeFilter.Create;
      FilterObject := CNSubsystemTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmCNSubsystemTypeFilterEdit.Free;
    frmCNSubsystemTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmCNSubsystemTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.