
unit ShowENPurchasesObjectReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPurchasesObjectReasonController ;


type
  TfrmENPurchasesObjectReasonShow = class(TChildForm)  
  HTTPRIOENPurchasesObjectReason: THTTPRIO;
    ImageList1: TImageList;
    sgENPurchasesObjectReason: TAdvStringGrid;
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
procedure sgENPurchasesObjectReasonTopLeftChanged(Sender: TObject);
procedure sgENPurchasesObjectReasonDblClick(Sender: TObject);
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
 // ENPurchasesObjectReasonObj: ENPurchasesObjectReason;
 // ENPurchasesObjectReasonFilterObj: ENPurchasesObjectReasonFilter;
  
  
implementation

uses Main, EditENPurchasesObjectReason, EditENPurchasesObjectReasonFilter;


{$R *.dfm}

var
  //frmENPurchasesObjectReasonShow : TfrmENPurchasesObjectReasonShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPurchasesObjectReasonHeaders: array [1..2] of String =
        ( 'Код'
          ,'Причина закупки'
        );
   

procedure TfrmENPurchasesObjectReasonShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPurchasesObjectReasonShow:=nil;
    inherited;
  end;


procedure TfrmENPurchasesObjectReasonShow.FormShow(Sender: TObject);
var
  TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
  i: Integer;
  ENPurchasesObjectReasonList: ENPurchasesObjectReasonShortList;
  begin
  SetGridHeaders(ENPurchasesObjectReasonHeaders, sgENPurchasesObjectReason.ColumnHeaders);
  ColCount:=100;
  TempENPurchasesObjectReason :=  HTTPRIOENPurchasesObjectReason as ENPurchasesObjectReasonControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesObjectReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesObjectReasonList := TempENPurchasesObjectReason.getScrollableFilteredList(ENPurchasesObjectReasonFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPurchasesObjectReasonList.list);

  if LastCount > -1 then
     sgENPurchasesObjectReason.RowCount:=LastCount+2
  else
     sgENPurchasesObjectReason.RowCount:=2;

   with sgENPurchasesObjectReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesObjectReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPurchasesObjectReasonList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPurchasesObjectReasonList.list[i].name;
        LastRow:=i+1;
        sgENPurchasesObjectReason.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPurchasesObjectReason.Row:=1;
end;

procedure TfrmENPurchasesObjectReasonShow.sgENPurchasesObjectReasonTopLeftChanged(Sender: TObject);
var
  TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
  i,CurrentRow: Integer;
  ENPurchasesObjectReasonList: ENPurchasesObjectReasonShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPurchasesObjectReason.TopRow + sgENPurchasesObjectReason.VisibleRowCount) = ColCount
  then
    begin
      TempENPurchasesObjectReason :=  HTTPRIOENPurchasesObjectReason as ENPurchasesObjectReasonControllerSoapPort;
      CurrentRow:=sgENPurchasesObjectReason.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesObjectReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesObjectReasonList := TempENPurchasesObjectReason.getScrollableFilteredList(ENPurchasesObjectReasonFilter(FilterObject),ColCount-1, 100);



  sgENPurchasesObjectReason.RowCount:=sgENPurchasesObjectReason.RowCount+100;
  LastCount:=High(ENPurchasesObjectReasonList.list);
  with sgENPurchasesObjectReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesObjectReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPurchasesObjectReasonList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPurchasesObjectReasonList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPurchasesObjectReason.Row:=CurrentRow-5;
   sgENPurchasesObjectReason.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPurchasesObjectReasonShow.sgENPurchasesObjectReasonDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPurchasesObjectReason,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPurchasesObjectReasonShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPurchasesObjectReason.RowCount-1 do
   for j:=0 to sgENPurchasesObjectReason.ColCount-1 do
     sgENPurchasesObjectReason.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPurchasesObjectReasonShow.actViewExecute(Sender: TObject);
Var TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
begin
 TempENPurchasesObjectReason := HTTPRIOENPurchasesObjectReason as ENPurchasesObjectReasonControllerSoapPort;
   try
     ENPurchasesObjectReasonObj := TempENPurchasesObjectReason.getObject(StrToInt(sgENPurchasesObjectReason.Cells[0,sgENPurchasesObjectReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesObjectReasonEdit:=TfrmENPurchasesObjectReasonEdit.Create(Application, dsView);
  try
    frmENPurchasesObjectReasonEdit.ShowModal;
  finally
    frmENPurchasesObjectReasonEdit.Free;
    frmENPurchasesObjectReasonEdit:=nil;
  end;
end;

procedure TfrmENPurchasesObjectReasonShow.actEditExecute(Sender: TObject);
Var TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
begin
 TempENPurchasesObjectReason := HTTPRIOENPurchasesObjectReason as ENPurchasesObjectReasonControllerSoapPort;
   try
     ENPurchasesObjectReasonObj := TempENPurchasesObjectReason.getObject(StrToInt(sgENPurchasesObjectReason.Cells[0,sgENPurchasesObjectReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesObjectReasonEdit:=TfrmENPurchasesObjectReasonEdit.Create(Application, dsEdit);
  try
    if frmENPurchasesObjectReasonEdit.ShowModal= mrOk then
      begin
        //TempENPurchasesObjectReason.save(ENPurchasesObjectReasonObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPurchasesObjectReasonEdit.Free;
    frmENPurchasesObjectReasonEdit:=nil;
  end;
end;

procedure TfrmENPurchasesObjectReasonShow.actDeleteExecute(Sender: TObject);
Var TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPurchasesObjectReason := HTTPRIOENPurchasesObjectReason as ENPurchasesObjectReasonControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPurchasesObjectReason.Cells[0,sgENPurchasesObjectReason.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Причина закупки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPurchasesObjectReason.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPurchasesObjectReasonShow.actInsertExecute(Sender: TObject);
Var TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
begin
  TempENPurchasesObjectReason := HTTPRIOENPurchasesObjectReason as ENPurchasesObjectReasonControllerSoapPort;
  ENPurchasesObjectReasonObj:=ENPurchasesObjectReason.Create;



  try
    frmENPurchasesObjectReasonEdit:=TfrmENPurchasesObjectReasonEdit.Create(Application, dsInsert);
    try
      if frmENPurchasesObjectReasonEdit.ShowModal = mrOk then
      begin
        if ENPurchasesObjectReasonObj<>nil then
            //TempENPurchasesObjectReason.add(ENPurchasesObjectReasonObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPurchasesObjectReasonEdit.Free;
      frmENPurchasesObjectReasonEdit:=nil;
    end;
  finally
    ENPurchasesObjectReasonObj.Free;
  end;
end;

procedure TfrmENPurchasesObjectReasonShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPurchasesObjectReasonShow.actFilterExecute(Sender: TObject);
begin
{frmENPurchasesObjectReasonFilterEdit:=TfrmENPurchasesObjectReasonFilterEdit.Create(Application, dsEdit);
  try
    ENPurchasesObjectReasonFilterObj := ENPurchasesObjectReasonFilter.Create;
    SetNullIntProps(ENPurchasesObjectReasonFilterObj);
    SetNullXSProps(ENPurchasesObjectReasonFilterObj);

    if frmENPurchasesObjectReasonFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPurchasesObjectReasonFilter.Create;
      FilterObject := ENPurchasesObjectReasonFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPurchasesObjectReasonFilterEdit.Free;
    frmENPurchasesObjectReasonFilterEdit:=nil;
  end;}
end;

procedure TfrmENPurchasesObjectReasonShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.