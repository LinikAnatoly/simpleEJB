
unit ShowENPlanWorkForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkFormController, AdvObj ;


type
  TfrmENPlanWorkFormShow = class(TChildForm)  
  HTTPRIOENPlanWorkForm: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkForm: TAdvStringGrid;
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
procedure sgENPlanWorkFormTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkFormDblClick(Sender: TObject);
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
 // ENPlanWorkFormObj: ENPlanWorkForm;
 // ENPlanWorkFormFilterObj: ENPlanWorkFormFilter;
 frmENPlanWorkFormShow : TfrmENPlanWorkFormShow;
  
implementation

uses Main, EditENPlanWorkForm, EditENPlanWorkFormFilter;


{$R *.dfm}

var
  //frmENPlanWorkFormShow : TfrmENPlanWorkFormShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkFormHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENPlanWorkFormShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkFormShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkFormShow.FormShow(Sender: TObject);
var
  TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
  i: Integer;
  ENPlanWorkFormList: ENPlanWorkFormShortList;
  begin
  SetGridHeaders(ENPlanWorkFormHeaders, sgENPlanWorkForm.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkForm :=  HTTPRIOENPlanWorkForm as ENPlanWorkFormControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkFormList := TempENPlanWorkForm.getScrollableFilteredList(ENPlanWorkFormFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkFormList.list);

  if LastCount > -1 then
     sgENPlanWorkForm.RowCount:=LastCount+2
  else
     sgENPlanWorkForm.RowCount:=2;

   with sgENPlanWorkForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkFormList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkFormList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanWorkFormList.list[i].name;
        LastRow:=i+1;
        sgENPlanWorkForm.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkForm.Row:=1;
end;

procedure TfrmENPlanWorkFormShow.sgENPlanWorkFormTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkFormList: ENPlanWorkFormShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkForm.TopRow + sgENPlanWorkForm.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkForm :=  HTTPRIOENPlanWorkForm as ENPlanWorkFormControllerSoapPort;
      CurrentRow:=sgENPlanWorkForm.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkFormList := TempENPlanWorkForm.getScrollableFilteredList(ENPlanWorkFormFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkForm.RowCount:=sgENPlanWorkForm.RowCount+100;
  LastCount:=High(ENPlanWorkFormList.list);
  with sgENPlanWorkForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkFormList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkFormList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanWorkFormList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkForm.Row:=CurrentRow-5;
   sgENPlanWorkForm.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkFormShow.sgENPlanWorkFormDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkForm,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkFormShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkForm.RowCount-1 do
   for j:=0 to sgENPlanWorkForm.ColCount-1 do
     sgENPlanWorkForm.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkFormShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
begin
 TempENPlanWorkForm := HTTPRIOENPlanWorkForm as ENPlanWorkFormControllerSoapPort;
   try
     ENPlanWorkFormObj := TempENPlanWorkForm.getObject(StrToInt(sgENPlanWorkForm.Cells[0,sgENPlanWorkForm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkFormEdit:=TfrmENPlanWorkFormEdit.Create(Application, dsView);
  try
    frmENPlanWorkFormEdit.ShowModal;
  finally
    frmENPlanWorkFormEdit.Free;
    frmENPlanWorkFormEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkFormShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
begin
 TempENPlanWorkForm := HTTPRIOENPlanWorkForm as ENPlanWorkFormControllerSoapPort;
   try
     ENPlanWorkFormObj := TempENPlanWorkForm.getObject(StrToInt(sgENPlanWorkForm.Cells[0,sgENPlanWorkForm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkFormEdit:=TfrmENPlanWorkFormEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkFormEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkForm.save(ENPlanWorkFormObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkFormEdit.Free;
    frmENPlanWorkFormEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkFormShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkForm := HTTPRIOENPlanWorkForm as ENPlanWorkFormControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkForm.Cells[0,sgENPlanWorkForm.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Форма плану) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkForm.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkFormShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
begin
  TempENPlanWorkForm := HTTPRIOENPlanWorkForm as ENPlanWorkFormControllerSoapPort;
  ENPlanWorkFormObj:=ENPlanWorkForm.Create;



  try
    frmENPlanWorkFormEdit:=TfrmENPlanWorkFormEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkFormEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkFormObj<>nil then
            //TempENPlanWorkForm.add(ENPlanWorkFormObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkFormEdit.Free;
      frmENPlanWorkFormEdit:=nil;
    end;
  finally
    ENPlanWorkFormObj.Free;
  end;
end;

procedure TfrmENPlanWorkFormShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkFormShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkFormFilterEdit:=TfrmENPlanWorkFormFilterEdit.Create(Application, dsEdit);
  try
    ENPlanWorkFormFilterObj := ENPlanWorkFormFilter.Create;
    SetNullIntProps(ENPlanWorkFormFilterObj);
    SetNullXSProps(ENPlanWorkFormFilterObj);

    if frmENPlanWorkFormFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWorkFormFilter.Create;
      FilterObject := ENPlanWorkFormFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkFormFilterEdit.Free;
    frmENPlanWorkFormFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkFormShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
