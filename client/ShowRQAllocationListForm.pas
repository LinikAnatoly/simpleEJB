
unit ShowRQAllocationListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQAllocationListFormController, AdvObj ;


type
  TfrmRQAllocationListFormShow = class(TChildForm)  
  HTTPRIORQAllocationListForm: THTTPRIO;
    ImageList1: TImageList;
    sgRQAllocationListForm: TAdvStringGrid;
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
procedure sgRQAllocationListFormTopLeftChanged(Sender: TObject);
procedure sgRQAllocationListFormDblClick(Sender: TObject);
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
 // RQAllocationListFormObj: RQAllocationListForm;
 // RQAllocationListFormFilterObj: RQAllocationListFormFilter;
  
  
implementation

uses Main, EditRQAllocationListForm, EditRQAllocationListFormFilter;


{$R *.dfm}

var
  //frmRQAllocationListFormShow : TfrmRQAllocationListFormShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQAllocationListFormHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmRQAllocationListFormShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQAllocationListFormShow:=nil;
    inherited;
  end;


procedure TfrmRQAllocationListFormShow.FormShow(Sender: TObject);
var
  TempRQAllocationListForm: RQAllocationListFormControllerSoapPort;
  i: Integer;
  RQAllocationListFormList: RQAllocationListFormShortList;
  begin
  SetGridHeaders(RQAllocationListFormHeaders, sgRQAllocationListForm.ColumnHeaders);
  ColCount:=100;
  TempRQAllocationListForm :=  HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListFormList := TempRQAllocationListForm.getScrollableFilteredList(RQAllocationListFormFilter(FilterObject),0,ColCount);


  LastCount:=High(RQAllocationListFormList.list);

  if LastCount > -1 then
     sgRQAllocationListForm.RowCount:=LastCount+2
  else
     sgRQAllocationListForm.RowCount:=2;

   with sgRQAllocationListForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListFormList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQAllocationListFormList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQAllocationListFormList.list[i].name;
        LastRow:=i+1;
        sgRQAllocationListForm.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQAllocationListForm.Row:=1;
end;

procedure TfrmRQAllocationListFormShow.sgRQAllocationListFormTopLeftChanged(Sender: TObject);
var
  TempRQAllocationListForm: RQAllocationListFormControllerSoapPort;
  i,CurrentRow: Integer;
  RQAllocationListFormList: RQAllocationListFormShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQAllocationListForm.TopRow + sgRQAllocationListForm.VisibleRowCount) = ColCount
  then
    begin
      TempRQAllocationListForm :=  HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;
      CurrentRow:=sgRQAllocationListForm.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListFormList := TempRQAllocationListForm.getScrollableFilteredList(RQAllocationListFormFilter(FilterObject),ColCount-1, 100);



  sgRQAllocationListForm.RowCount:=sgRQAllocationListForm.RowCount+100;
  LastCount:=High(RQAllocationListFormList.list);
  with sgRQAllocationListForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListFormList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQAllocationListFormList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQAllocationListFormList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQAllocationListForm.Row:=CurrentRow-5;
   sgRQAllocationListForm.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQAllocationListFormShow.sgRQAllocationListFormDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQAllocationListForm,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQAllocationListFormShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQAllocationListForm.RowCount-1 do
   for j:=0 to sgRQAllocationListForm.ColCount-1 do
     sgRQAllocationListForm.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQAllocationListFormShow.actViewExecute(Sender: TObject);
Var TempRQAllocationListForm: RQAllocationListFormControllerSoapPort;
begin
 TempRQAllocationListForm := HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;
   try
     RQAllocationListFormObj := TempRQAllocationListForm.getObject(StrToInt(sgRQAllocationListForm.Cells[0,sgRQAllocationListForm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListFormEdit:=TfrmRQAllocationListFormEdit.Create(Application, dsView);
  try
    frmRQAllocationListFormEdit.ShowModal;
  finally
    frmRQAllocationListFormEdit.Free;
    frmRQAllocationListFormEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListFormShow.actEditExecute(Sender: TObject);
Var TempRQAllocationListForm: RQAllocationListFormControllerSoapPort;
begin
 TempRQAllocationListForm := HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;
   try
     RQAllocationListFormObj := TempRQAllocationListForm.getObject(StrToInt(sgRQAllocationListForm.Cells[0,sgRQAllocationListForm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListFormEdit:=TfrmRQAllocationListFormEdit.Create(Application, dsEdit);
  try
    if frmRQAllocationListFormEdit.ShowModal= mrOk then
      begin
        //TempRQAllocationListForm.save(RQAllocationListFormObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQAllocationListFormEdit.Free;
    frmRQAllocationListFormEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListFormShow.actDeleteExecute(Sender: TObject);
Var TempRQAllocationListForm: RQAllocationListFormControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQAllocationListForm := HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQAllocationListForm.Cells[0,sgRQAllocationListForm.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид відомості розподілу залишків (Планова, Позапланова...)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQAllocationListForm.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQAllocationListFormShow.actInsertExecute(Sender: TObject);
// Var TempRQAllocationListForm: RQAllocationListFormControllerSoapPort; 
begin
  // TempRQAllocationListForm := HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQAllocationListFormObj:=RQAllocationListForm.Create;



  try
    frmRQAllocationListFormEdit:=TfrmRQAllocationListFormEdit.Create(Application, dsInsert);
    try
      if frmRQAllocationListFormEdit.ShowModal = mrOk then
      begin
        if RQAllocationListFormObj<>nil then
            //TempRQAllocationListForm.add(RQAllocationListFormObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQAllocationListFormEdit.Free;
      frmRQAllocationListFormEdit:=nil;
    end;
  finally
    RQAllocationListFormObj.Free;
  end;
end;

procedure TfrmRQAllocationListFormShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListFormShow.actFilterExecute(Sender: TObject);
begin
{frmRQAllocationListFormFilterEdit:=TfrmRQAllocationListFormFilterEdit.Create(Application, dsInsert);
  try
    RQAllocationListFormFilterObj := RQAllocationListFormFilter.Create;
    SetNullIntProps(RQAllocationListFormFilterObj);
    SetNullXSProps(RQAllocationListFormFilterObj);

    if frmRQAllocationListFormFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQAllocationListFormFilter.Create;
      FilterObject := RQAllocationListFormFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQAllocationListFormFilterEdit.Free;
    frmRQAllocationListFormFilterEdit:=nil;
  end;}
end;

procedure TfrmRQAllocationListFormShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.