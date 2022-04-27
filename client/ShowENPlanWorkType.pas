
unit ShowENPlanWorkType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkTypeController, AdvObj ;

 type
  TProcChooseENPlanWorkTypeHandler = reference to procedure(selectedObj: ENPlanWorkTypeShort);

type
  TfrmENPlanWorkTypeShow = class(TChildForm)  
  HTTPRIOENPlanWorkType: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkType: TAdvStringGrid;
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
procedure sgENPlanWorkTypeTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkTypeDblClick(Sender: TObject);
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
   class procedure chooseFromList(proc: TProcChooseENPlanWorkTypeHandler);
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENPlanWorkTypeShow : TfrmENPlanWorkTypeShow;
 // ENPlanWorkTypeObj: ENPlanWorkType;
 // ENPlanWorkTypeFilterObj: ENPlanWorkTypeFilter;
  
  
implementation

uses Main, EditENPlanWorkType, EditENPlanWorkTypeFilter;


{$R *.dfm}

var
  //frmENPlanWorkTypeShow : TfrmENPlanWorkTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Вид робіт'
          ,'Вид робіт (скорочено)'
        );
   
class procedure TfrmENPlanWorkTypeShow.chooseFromList(proc: TProcChooseENPlanWorkTypeHandler);
var
  f1 : ENPlanWorkTypeFilter;
  frmENPlanWorkTypeShow : TfrmENPlanWorkTypeShow;
  selected : ENPlanWorkTypeShort;
begin
  inherited;
     f1 := ENPlanWorkTypeFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal, f1);

       try
          with frmENPlanWorkTypeShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENPlanWorkTypeShort(sgENPlanWorkType.Objects[0, sgENPlanWorkType.Row]);
                  proc(selected);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmENPlanWorkTypeShow.Free;
       end;

end;

procedure TfrmENPlanWorkTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkTypeShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkTypeShow.FormShow(Sender: TObject);
var
  TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
  i: Integer;
  ENPlanWorkTypeList: ENPlanWorkTypeShortList;
  begin
  SetGridHeaders(ENPlanWorkTypeHeaders, sgENPlanWorkType.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkType :=  HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkTypeList := TempENPlanWorkType.getScrollableFilteredList(ENPlanWorkTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkTypeList.list);

  if LastCount > -1 then
     sgENPlanWorkType.RowCount:=LastCount+2
  else
     sgENPlanWorkType.RowCount:=2;

   with sgENPlanWorkType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanWorkTypeList.list[i].name;
        Cells[2,i+1] := ENPlanWorkTypeList.list[i].shortName;
        LastRow:=i+1;
        sgENPlanWorkType.RowCount:=LastRow+1;

        Objects[0,i+1] := ENPlanWorkTypeList.list[i];
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkType.Row:=1;
end;

procedure TfrmENPlanWorkTypeShow.sgENPlanWorkTypeTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkTypeList: ENPlanWorkTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkType.TopRow + sgENPlanWorkType.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkType :=  HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
      CurrentRow:=sgENPlanWorkType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkTypeList := TempENPlanWorkType.getScrollableFilteredList(ENPlanWorkTypeFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkType.RowCount:=sgENPlanWorkType.RowCount+100;
  LastCount:=High(ENPlanWorkTypeList.list);
  with sgENPlanWorkType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanWorkTypeList.list[i].name;
        Cells[2,i+CurrentRow] := ENPlanWorkTypeList.list[i].shortName;
        LastRow:=i+CurrentRow;
        Objects[0,i+CurrentRow] := ENPlanWorkTypeList.list[i];
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkType.Row:=CurrentRow-5;
   sgENPlanWorkType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkTypeShow.sgENPlanWorkTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkType.RowCount-1 do
   for j:=0 to sgENPlanWorkType.ColCount-1 do
     sgENPlanWorkType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkTypeShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
begin
 TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
   try
     ENPlanWorkTypeObj := TempENPlanWorkType.getObject(StrToInt(sgENPlanWorkType.Cells[0,sgENPlanWorkType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkTypeEdit:=TfrmENPlanWorkTypeEdit.Create(Application, dsView);
  try
    frmENPlanWorkTypeEdit.ShowModal;
  finally
    frmENPlanWorkTypeEdit.Free;
    frmENPlanWorkTypeEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkTypeShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
begin
 TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
   try
     ENPlanWorkTypeObj := TempENPlanWorkType.getObject(StrToInt(sgENPlanWorkType.Cells[0,sgENPlanWorkType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkTypeEdit:=TfrmENPlanWorkTypeEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkTypeEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkType.save(ENPlanWorkTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkTypeEdit.Free;
    frmENPlanWorkTypeEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkTypeShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkType.Cells[0,sgENPlanWorkType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkTypeShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
begin
  TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
  ENPlanWorkTypeObj:=ENPlanWorkType.Create;



  try
    frmENPlanWorkTypeEdit:=TfrmENPlanWorkTypeEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkTypeEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkTypeObj<>nil then
            //TempENPlanWorkType.add(ENPlanWorkTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkTypeEdit.Free;
      frmENPlanWorkTypeEdit:=nil;
    end;
  finally
    ENPlanWorkTypeObj.Free;
  end;
end;

procedure TfrmENPlanWorkTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkTypeFilterEdit:=TfrmENPlanWorkTypeFilterEdit.Create(Application, dsEdit);
  try
    ENPlanWorkTypeFilterObj := ENPlanWorkTypeFilter.Create;
    SetNullIntProps(ENPlanWorkTypeFilterObj);
    SetNullXSProps(ENPlanWorkTypeFilterObj);

    if frmENPlanWorkTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWorkTypeFilter.Create;
      FilterObject := ENPlanWorkTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkTypeFilterEdit.Free;
    frmENPlanWorkTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.