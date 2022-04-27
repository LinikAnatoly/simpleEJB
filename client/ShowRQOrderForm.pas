
unit ShowRQOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderFormController, AdvObj ;


type
  TfrmRQOrderFormShow = class(TChildForm)  
  HTTPRIORQOrderForm: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderForm: TAdvStringGrid;
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
procedure sgRQOrderFormTopLeftChanged(Sender: TObject);
procedure sgRQOrderFormDblClick(Sender: TObject);
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
 frmRQOrderFormShow : TfrmRQOrderFormShow;
 // RQOrderFormObj: RQOrderForm;
 // RQOrderFormFilterObj: RQOrderFormFilter;
  
  
implementation

uses Main, EditRQOrderForm, EditRQOrderFormFilter;


{$R *.dfm}

var
  //frmRQOrderFormShow : TfrmRQOrderFormShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderFormHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование '
        );
   

procedure TfrmRQOrderFormShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderFormShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderFormShow.FormShow(Sender: TObject);
var
  TempRQOrderForm: RQOrderFormControllerSoapPort;
  i: Integer;
  RQOrderFormList: RQOrderFormShortList;
  begin
  SetGridHeaders(RQOrderFormHeaders, sgRQOrderForm.ColumnHeaders);
  ColCount:=100;
  TempRQOrderForm :=  HTTPRIORQOrderForm as RQOrderFormControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderFormList := TempRQOrderForm.getScrollableFilteredList(RQOrderFormFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderFormList.list);

  if LastCount > -1 then
     sgRQOrderForm.RowCount:=LastCount+2
  else
     sgRQOrderForm.RowCount:=2;

   with sgRQOrderForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderFormList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderFormList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderFormList.list[i].name;
        LastRow:=i+1;
        sgRQOrderForm.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderForm.Row:=1;
end;

procedure TfrmRQOrderFormShow.sgRQOrderFormTopLeftChanged(Sender: TObject);
var
  TempRQOrderForm: RQOrderFormControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderFormList: RQOrderFormShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderForm.TopRow + sgRQOrderForm.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderForm :=  HTTPRIORQOrderForm as RQOrderFormControllerSoapPort;
      CurrentRow:=sgRQOrderForm.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderFormList := TempRQOrderForm.getScrollableFilteredList(RQOrderFormFilter(FilterObject),ColCount-1, 100);



  sgRQOrderForm.RowCount:=sgRQOrderForm.RowCount+100;
  LastCount:=High(RQOrderFormList.list);
  with sgRQOrderForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderFormList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderFormList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderFormList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderForm.Row:=CurrentRow-5;
   sgRQOrderForm.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderFormShow.sgRQOrderFormDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderForm,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderFormShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderForm.RowCount-1 do
   for j:=0 to sgRQOrderForm.ColCount-1 do
     sgRQOrderForm.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderFormShow.actViewExecute(Sender: TObject);
Var TempRQOrderForm: RQOrderFormControllerSoapPort;
begin
 TempRQOrderForm := HTTPRIORQOrderForm as RQOrderFormControllerSoapPort;
   try
     RQOrderFormObj := TempRQOrderForm.getObject(StrToInt(sgRQOrderForm.Cells[0,sgRQOrderForm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderFormEdit:=TfrmRQOrderFormEdit.Create(Application, dsView);
  try
    frmRQOrderFormEdit.ShowModal;
  finally
    frmRQOrderFormEdit.Free;
    frmRQOrderFormEdit:=nil;
  end;
end;

procedure TfrmRQOrderFormShow.actEditExecute(Sender: TObject);
Var TempRQOrderForm: RQOrderFormControllerSoapPort;
begin
 TempRQOrderForm := HTTPRIORQOrderForm as RQOrderFormControllerSoapPort;
   try
     RQOrderFormObj := TempRQOrderForm.getObject(StrToInt(sgRQOrderForm.Cells[0,sgRQOrderForm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderFormEdit:=TfrmRQOrderFormEdit.Create(Application, dsEdit);
  try
    if frmRQOrderFormEdit.ShowModal= mrOk then
      begin
        //TempRQOrderForm.save(RQOrderFormObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderFormEdit.Free;
    frmRQOrderFormEdit:=nil;
  end;
end;

procedure TfrmRQOrderFormShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderForm: RQOrderFormControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderForm := HTTPRIORQOrderForm as RQOrderFormControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderForm.Cells[0,sgRQOrderForm.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид заявки (1 - Плановая, 2 - Внеплановая)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderForm.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderFormShow.actInsertExecute(Sender: TObject);
Var TempRQOrderForm: RQOrderFormControllerSoapPort;
begin
  TempRQOrderForm := HTTPRIORQOrderForm as RQOrderFormControllerSoapPort;
  RQOrderFormObj:=RQOrderForm.Create;



  try
    frmRQOrderFormEdit:=TfrmRQOrderFormEdit.Create(Application, dsInsert);
    try
      if frmRQOrderFormEdit.ShowModal = mrOk then
      begin
        if RQOrderFormObj<>nil then
            //TempRQOrderForm.add(RQOrderFormObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderFormEdit.Free;
      frmRQOrderFormEdit:=nil;
    end;
  finally
    RQOrderFormObj.Free;
  end;
end;

procedure TfrmRQOrderFormShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderFormShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderFormFilterEdit:=TfrmRQOrderFormFilterEdit.Create(Application, dsEdit);
  try
    RQOrderFormFilterObj := RQOrderFormFilter.Create;
    SetNullIntProps(RQOrderFormFilterObj);
    SetNullXSProps(RQOrderFormFilterObj);

    if frmRQOrderFormFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderFormFilter.Create;
      FilterObject := RQOrderFormFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderFormFilterEdit.Free;
    frmRQOrderFormFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderFormShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.