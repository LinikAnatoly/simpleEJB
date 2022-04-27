
unit ShowENScale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENScaleController, AdvObj;


type
  TfrmENScaleShow = class(TChildForm)  
  HTTPRIOENScale: THTTPRIO;
    ImageList1: TImageList;
    sgENScale: TAdvStringGrid;
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
procedure sgENScaleTopLeftChanged(Sender: TObject);
procedure sgENScaleDblClick(Sender: TObject);
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
 frmENScaleShow : TfrmENScaleShow;
 // ENScaleObj: ENScale;
 // ENScaleFilterObj: ENScaleFilter;
  
  
implementation

uses Main, EditENScale, EditENScaleFilter;


{$R *.dfm}

var
  //frmENScaleShow : TfrmENScaleShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENScaleHeaders: array [1..2] of String =
        ( 'Код'
          ,'Шкала'
        );
   

procedure TfrmENScaleShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENScaleShow:=nil;
    inherited;
  end;


procedure TfrmENScaleShow.FormShow(Sender: TObject);
var
  TempENScale: ENScaleControllerSoapPort;
  i: Integer;
  ENScaleList: ENScaleShortList;
  begin
  SetGridHeaders(ENScaleHeaders, sgENScale.ColumnHeaders);
  ColCount:=100;
  TempENScale :=  HTTPRIOENScale as ENScaleControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENScaleFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENScaleList := TempENScale.getScrollableFilteredList(ENScaleFilter(FilterObject),0,ColCount);


  LastCount:=High(ENScaleList.list);

  if LastCount > -1 then
     sgENScale.RowCount:=LastCount+2
  else
     sgENScale.RowCount:=2;

   with sgENScale do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENScaleList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENScaleList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENScaleList.list[i].name;
        LastRow:=i+1;
        sgENScale.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENScale.Row:=1;
end;

procedure TfrmENScaleShow.sgENScaleTopLeftChanged(Sender: TObject);
var
  TempENScale: ENScaleControllerSoapPort;
  i,CurrentRow: Integer;
  ENScaleList: ENScaleShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENScale.TopRow + sgENScale.VisibleRowCount) = ColCount
  then
    begin
      TempENScale :=  HTTPRIOENScale as ENScaleControllerSoapPort;
      CurrentRow:=sgENScale.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENScaleFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENScaleList := TempENScale.getScrollableFilteredList(ENScaleFilter(FilterObject),ColCount-1, 100);



  sgENScale.RowCount:=sgENScale.RowCount+100;
  LastCount:=High(ENScaleList.list);
  with sgENScale do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENScaleList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENScaleList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENScaleList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENScale.Row:=CurrentRow-5;
   sgENScale.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENScaleShow.sgENScaleDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENScale,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENScaleShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENScale.RowCount-1 do
   for j:=0 to sgENScale.ColCount-1 do
     sgENScale.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENScaleShow.actViewExecute(Sender: TObject);
Var TempENScale: ENScaleControllerSoapPort;
begin
 TempENScale := HTTPRIOENScale as ENScaleControllerSoapPort;
   try
     ENScaleObj := TempENScale.getObject(StrToInt(sgENScale.Cells[0,sgENScale.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENScaleEdit:=TfrmENScaleEdit.Create(Application, dsView);
  try
    frmENScaleEdit.ShowModal;
  finally
    frmENScaleEdit.Free;
    frmENScaleEdit:=nil;
  end;
end;

procedure TfrmENScaleShow.actEditExecute(Sender: TObject);
Var TempENScale: ENScaleControllerSoapPort;
begin
 TempENScale := HTTPRIOENScale as ENScaleControllerSoapPort;
   try
     ENScaleObj := TempENScale.getObject(StrToInt(sgENScale.Cells[0,sgENScale.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENScaleEdit:=TfrmENScaleEdit.Create(Application, dsEdit);
  try
    if frmENScaleEdit.ShowModal= mrOk then
      begin
        //TempENScale.save(ENScaleObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENScaleEdit.Free;
    frmENScaleEdit:=nil;
  end;
end;

procedure TfrmENScaleShow.actDeleteExecute(Sender: TObject);
Var TempENScale: ENScaleControllerSoapPort;
  ObjCode: Integer;
begin
 TempENScale := HTTPRIOENScale as ENScaleControllerSoapPort;
   try
     ObjCode := StrToInt(sgENScale.Cells[0,sgENScale.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Шкалы) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENScale.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENScaleShow.actInsertExecute(Sender: TObject);
Var TempENScale: ENScaleControllerSoapPort;
begin
  TempENScale := HTTPRIOENScale as ENScaleControllerSoapPort;
  ENScaleObj:=ENScale.Create;



  try
    frmENScaleEdit:=TfrmENScaleEdit.Create(Application, dsInsert);
    try
      if frmENScaleEdit.ShowModal = mrOk then
      begin
        if ENScaleObj<>nil then
            //TempENScale.add(ENScaleObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENScaleEdit.Free;
      frmENScaleEdit:=nil;
    end;
  finally
    ENScaleObj.Free;
  end;
end;

procedure TfrmENScaleShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENScaleShow.actFilterExecute(Sender: TObject);
begin
{frmENScaleFilterEdit:=TfrmENScaleFilterEdit.Create(Application, dsInsert);
  try
    ENScaleFilterObj := ENScaleFilter.Create;
    SetNullIntProps(ENScaleFilterObj);
    SetNullXSProps(ENScaleFilterObj);

    if frmENScaleFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENScaleFilter.Create;
      FilterObject := ENScaleFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENScaleFilterEdit.Free;
    frmENScaleFilterEdit:=nil;
  end;}
end;

procedure TfrmENScaleShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.