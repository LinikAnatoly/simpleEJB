
unit ShowRQStorageZone2RestPurpose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQStorageZone2RestPurposeController ;


type
  TfrmRQStorageZone2RestPurposeShow = class(TChildForm)  
  HTTPRIORQStorageZone2RestPurpose: THTTPRIO;
    ImageList1: TImageList;
    sgRQStorageZone2RestPurpose: TAdvStringGrid;
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
procedure sgRQStorageZone2RestPurposeTopLeftChanged(Sender: TObject);
procedure sgRQStorageZone2RestPurposeDblClick(Sender: TObject);
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
 // RQStorageZone2RestPurposeObj: RQStorageZone2RestPurpose;
 // RQStorageZone2RestPurposeFilterObj: RQStorageZone2RestPurposeFilter;
  
  
implementation

uses Main, EditRQStorageZone2RestPurpose, EditRQStorageZone2RestPurposeFilter;


{$R *.dfm}

var
  //frmRQStorageZone2RestPurposeShow : TfrmRQStorageZone2RestPurposeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorageZone2RestPurposeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQStorageZone2RestPurposeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQStorageZone2RestPurposeShow:=nil;
    inherited;
  end;


procedure TfrmRQStorageZone2RestPurposeShow.FormShow(Sender: TObject);
var
  TempRQStorageZone2RestPurpose: RQStorageZone2RestPurposeControllerSoapPort;
  i: Integer;
  RQStorageZone2RestPurposeList: RQStorageZone2RestPurposeShortList;
  begin
  SetGridHeaders(RQStorageZone2RestPurposeHeaders, sgRQStorageZone2RestPurpose.ColumnHeaders);
  ColCount:=100;
  TempRQStorageZone2RestPurpose :=  HTTPRIORQStorageZone2RestPurpose as RQStorageZone2RestPurposeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageZone2RestPurposeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageZone2RestPurposeList := TempRQStorageZone2RestPurpose.getScrollableFilteredList(RQStorageZone2RestPurposeFilter(FilterObject),0,ColCount);


  LastCount:=High(RQStorageZone2RestPurposeList.list);

  if LastCount > -1 then
     sgRQStorageZone2RestPurpose.RowCount:=LastCount+2
  else
     sgRQStorageZone2RestPurpose.RowCount:=2;

   with sgRQStorageZone2RestPurpose do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorageZone2RestPurposeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQStorageZone2RestPurposeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQStorageZone2RestPurposeList.list[i].userGen;
        if RQStorageZone2RestPurposeList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(RQStorageZone2RestPurposeList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQStorageZone2RestPurpose.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQStorageZone2RestPurpose.Row:=1;
end;

procedure TfrmRQStorageZone2RestPurposeShow.sgRQStorageZone2RestPurposeTopLeftChanged(Sender: TObject);
var
  TempRQStorageZone2RestPurpose: RQStorageZone2RestPurposeControllerSoapPort;
  i,CurrentRow: Integer;
  RQStorageZone2RestPurposeList: RQStorageZone2RestPurposeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQStorageZone2RestPurpose.TopRow + sgRQStorageZone2RestPurpose.VisibleRowCount) = ColCount
  then
    begin
      TempRQStorageZone2RestPurpose :=  HTTPRIORQStorageZone2RestPurpose as RQStorageZone2RestPurposeControllerSoapPort;
      CurrentRow:=sgRQStorageZone2RestPurpose.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageZone2RestPurposeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageZone2RestPurposeList := TempRQStorageZone2RestPurpose.getScrollableFilteredList(RQStorageZone2RestPurposeFilter(FilterObject),ColCount-1, 100);



  sgRQStorageZone2RestPurpose.RowCount:=sgRQStorageZone2RestPurpose.RowCount+100;
  LastCount:=High(RQStorageZone2RestPurposeList.list);
  with sgRQStorageZone2RestPurpose do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorageZone2RestPurposeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQStorageZone2RestPurposeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQStorageZone2RestPurposeList.list[i].userGen;
        if RQStorageZone2RestPurposeList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(RQStorageZone2RestPurposeList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQStorageZone2RestPurpose.Row:=CurrentRow-5;
   sgRQStorageZone2RestPurpose.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQStorageZone2RestPurposeShow.sgRQStorageZone2RestPurposeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQStorageZone2RestPurpose,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQStorageZone2RestPurposeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQStorageZone2RestPurpose.RowCount-1 do
   for j:=0 to sgRQStorageZone2RestPurpose.ColCount-1 do
     sgRQStorageZone2RestPurpose.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQStorageZone2RestPurposeShow.actViewExecute(Sender: TObject);
Var TempRQStorageZone2RestPurpose: RQStorageZone2RestPurposeControllerSoapPort;
begin
 TempRQStorageZone2RestPurpose := HTTPRIORQStorageZone2RestPurpose as RQStorageZone2RestPurposeControllerSoapPort;
   try
     RQStorageZone2RestPurposeObj := TempRQStorageZone2RestPurpose.getObject(StrToInt(sgRQStorageZone2RestPurpose.Cells[0,sgRQStorageZone2RestPurpose.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageZone2RestPurposeEdit:=TfrmRQStorageZone2RestPurposeEdit.Create(Application, dsView);
  try
    frmRQStorageZone2RestPurposeEdit.ShowModal;
  finally
    frmRQStorageZone2RestPurposeEdit.Free;
    frmRQStorageZone2RestPurposeEdit:=nil;
  end;
end;

procedure TfrmRQStorageZone2RestPurposeShow.actEditExecute(Sender: TObject);
Var TempRQStorageZone2RestPurpose: RQStorageZone2RestPurposeControllerSoapPort;
begin
 TempRQStorageZone2RestPurpose := HTTPRIORQStorageZone2RestPurpose as RQStorageZone2RestPurposeControllerSoapPort;
   try
     RQStorageZone2RestPurposeObj := TempRQStorageZone2RestPurpose.getObject(StrToInt(sgRQStorageZone2RestPurpose.Cells[0,sgRQStorageZone2RestPurpose.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageZone2RestPurposeEdit:=TfrmRQStorageZone2RestPurposeEdit.Create(Application, dsEdit);
  try
    if frmRQStorageZone2RestPurposeEdit.ShowModal= mrOk then
      begin
        //TempRQStorageZone2RestPurpose.save(RQStorageZone2RestPurposeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQStorageZone2RestPurposeEdit.Free;
    frmRQStorageZone2RestPurposeEdit:=nil;
  end;
end;

procedure TfrmRQStorageZone2RestPurposeShow.actDeleteExecute(Sender: TObject);
Var TempRQStorageZone2RestPurpose: RQStorageZone2RestPurposeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQStorageZone2RestPurpose := HTTPRIORQStorageZone2RestPurpose as RQStorageZone2RestPurposeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQStorageZone2RestPurpose.Cells[0,sgRQStorageZone2RestPurpose.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок місць зберігання з призначеннями залишку з ФК) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQStorageZone2RestPurpose.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQStorageZone2RestPurposeShow.actInsertExecute(Sender: TObject);
// Var TempRQStorageZone2RestPurpose: RQStorageZone2RestPurposeControllerSoapPort; 
begin
  // TempRQStorageZone2RestPurpose := HTTPRIORQStorageZone2RestPurpose as RQStorageZone2RestPurposeControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQStorageZone2RestPurposeObj:=RQStorageZone2RestPurpose.Create;

   //RQStorageZone2RestPurposeObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQStorageZone2RestPurposeEdit:=TfrmRQStorageZone2RestPurposeEdit.Create(Application, dsInsert);
    try
      if frmRQStorageZone2RestPurposeEdit.ShowModal = mrOk then
      begin
        if RQStorageZone2RestPurposeObj<>nil then
            //TempRQStorageZone2RestPurpose.add(RQStorageZone2RestPurposeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQStorageZone2RestPurposeEdit.Free;
      frmRQStorageZone2RestPurposeEdit:=nil;
    end;
  finally
    RQStorageZone2RestPurposeObj.Free;
  end;
end;

procedure TfrmRQStorageZone2RestPurposeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQStorageZone2RestPurposeShow.actFilterExecute(Sender: TObject);
begin
{frmRQStorageZone2RestPurposeFilterEdit:=TfrmRQStorageZone2RestPurposeFilterEdit.Create(Application, dsInsert);
  try
    RQStorageZone2RestPurposeFilterObj := RQStorageZone2RestPurposeFilter.Create;
    SetNullIntProps(RQStorageZone2RestPurposeFilterObj);
    SetNullXSProps(RQStorageZone2RestPurposeFilterObj);

    if frmRQStorageZone2RestPurposeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQStorageZone2RestPurposeFilter.Create;
      FilterObject := RQStorageZone2RestPurposeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQStorageZone2RestPurposeFilterEdit.Free;
    frmRQStorageZone2RestPurposeFilterEdit:=nil;
  end;}
end;

procedure TfrmRQStorageZone2RestPurposeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.