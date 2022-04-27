
unit ShowENBindingOverOrganization;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBindingOverOrganizationController, AdvObj ;


type
  TfrmENBindingOverOrganizationShow = class(TChildForm)  
  HTTPRIOENBindingOverOrganization: THTTPRIO;
    ImageList1: TImageList;
    sgENBindingOverOrganization: TAdvStringGrid;
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
procedure sgENBindingOverOrganizationTopLeftChanged(Sender: TObject);
procedure sgENBindingOverOrganizationDblClick(Sender: TObject);
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
 frmENBindingOverOrganizationShow : TfrmENBindingOverOrganizationShow;
 // ENBindingOverOrganizationObj: ENBindingOverOrganization;
 // ENBindingOverOrganizationFilterObj: ENBindingOverOrganizationFilter;
  
  
implementation

uses Main, EditENBindingOverOrganization, EditENBindingOverOrganizationFilter;


{$R *.dfm}

var
  //frmENBindingOverOrganizationShow : TfrmENBindingOverOrganizationShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBindingOverOrganizationHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва организації, яка видала припис'
        );
   

procedure TfrmENBindingOverOrganizationShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBindingOverOrganizationShow:=nil;
    inherited;
  end;


procedure TfrmENBindingOverOrganizationShow.FormShow(Sender: TObject);
var
  TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
  i: Integer;
  ENBindingOverOrganizationList: ENBindingOverOrganizationShortList;
  begin
  SetGridHeaders(ENBindingOverOrganizationHeaders, sgENBindingOverOrganization.ColumnHeaders);
  ColCount:=100;
  TempENBindingOverOrganization :=  HTTPRIOENBindingOverOrganization as ENBindingOverOrganizationControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBindingOverOrganizationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBindingOverOrganizationList := TempENBindingOverOrganization.getScrollableFilteredList(ENBindingOverOrganizationFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBindingOverOrganizationList.list);

  if LastCount > -1 then
     sgENBindingOverOrganization.RowCount:=LastCount+2
  else
     sgENBindingOverOrganization.RowCount:=2;

   with sgENBindingOverOrganization do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBindingOverOrganizationList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBindingOverOrganizationList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBindingOverOrganizationList.list[i].name;
        LastRow:=i+1;
        sgENBindingOverOrganization.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBindingOverOrganization.Row:=1;
end;

procedure TfrmENBindingOverOrganizationShow.sgENBindingOverOrganizationTopLeftChanged(Sender: TObject);
var
  TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
  i,CurrentRow: Integer;
  ENBindingOverOrganizationList: ENBindingOverOrganizationShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBindingOverOrganization.TopRow + sgENBindingOverOrganization.VisibleRowCount) = ColCount
  then
    begin
      TempENBindingOverOrganization :=  HTTPRIOENBindingOverOrganization as ENBindingOverOrganizationControllerSoapPort;
      CurrentRow:=sgENBindingOverOrganization.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBindingOverOrganizationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBindingOverOrganizationList := TempENBindingOverOrganization.getScrollableFilteredList(ENBindingOverOrganizationFilter(FilterObject),ColCount-1, 100);



  sgENBindingOverOrganization.RowCount:=sgENBindingOverOrganization.RowCount+100;
  LastCount:=High(ENBindingOverOrganizationList.list);
  with sgENBindingOverOrganization do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBindingOverOrganizationList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBindingOverOrganizationList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBindingOverOrganizationList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBindingOverOrganization.Row:=CurrentRow-5;
   sgENBindingOverOrganization.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBindingOverOrganizationShow.sgENBindingOverOrganizationDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBindingOverOrganization,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBindingOverOrganizationShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBindingOverOrganization.RowCount-1 do
   for j:=0 to sgENBindingOverOrganization.ColCount-1 do
     sgENBindingOverOrganization.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBindingOverOrganizationShow.actViewExecute(Sender: TObject);
Var TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
begin
 TempENBindingOverOrganization := HTTPRIOENBindingOverOrganization as ENBindingOverOrganizationControllerSoapPort;
   try
     ENBindingOverOrganizationObj := TempENBindingOverOrganization.getObject(StrToInt(sgENBindingOverOrganization.Cells[0,sgENBindingOverOrganization.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBindingOverOrganizationEdit:=TfrmENBindingOverOrganizationEdit.Create(Application, dsView);
  try
    frmENBindingOverOrganizationEdit.ShowModal;
  finally
    frmENBindingOverOrganizationEdit.Free;
    frmENBindingOverOrganizationEdit:=nil;
  end;
end;

procedure TfrmENBindingOverOrganizationShow.actEditExecute(Sender: TObject);
Var TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
begin
 TempENBindingOverOrganization := HTTPRIOENBindingOverOrganization as ENBindingOverOrganizationControllerSoapPort;
   try
     ENBindingOverOrganizationObj := TempENBindingOverOrganization.getObject(StrToInt(sgENBindingOverOrganization.Cells[0,sgENBindingOverOrganization.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBindingOverOrganizationEdit:=TfrmENBindingOverOrganizationEdit.Create(Application, dsEdit);
  try
    if frmENBindingOverOrganizationEdit.ShowModal= mrOk then
      begin
        //TempENBindingOverOrganization.save(ENBindingOverOrganizationObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBindingOverOrganizationEdit.Free;
    frmENBindingOverOrganizationEdit:=nil;
  end;
end;

procedure TfrmENBindingOverOrganizationShow.actDeleteExecute(Sender: TObject);
Var TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBindingOverOrganization := HTTPRIOENBindingOverOrganization as ENBindingOverOrganizationControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBindingOverOrganization.Cells[0,sgENBindingOverOrganization.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Организація, яка видала припис) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBindingOverOrganization.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBindingOverOrganizationShow.actInsertExecute(Sender: TObject);
Var TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
begin
  TempENBindingOverOrganization := HTTPRIOENBindingOverOrganization as ENBindingOverOrganizationControllerSoapPort;
  ENBindingOverOrganizationObj:=ENBindingOverOrganization.Create;



  try
    frmENBindingOverOrganizationEdit:=TfrmENBindingOverOrganizationEdit.Create(Application, dsInsert);
    try
      if frmENBindingOverOrganizationEdit.ShowModal = mrOk then
      begin
        if ENBindingOverOrganizationObj<>nil then
            //TempENBindingOverOrganization.add(ENBindingOverOrganizationObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBindingOverOrganizationEdit.Free;
      frmENBindingOverOrganizationEdit:=nil;
    end;
  finally
    ENBindingOverOrganizationObj.Free;
  end;
end;

procedure TfrmENBindingOverOrganizationShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBindingOverOrganizationShow.actFilterExecute(Sender: TObject);
begin
{frmENBindingOverOrganizationFilterEdit:=TfrmENBindingOverOrganizationFilterEdit.Create(Application, dsEdit);
  try
    ENBindingOverOrganizationFilterObj := ENBindingOverOrganizationFilter.Create;
    SetNullIntProps(ENBindingOverOrganizationFilterObj);
    SetNullXSProps(ENBindingOverOrganizationFilterObj);

    if frmENBindingOverOrganizationFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBindingOverOrganizationFilter.Create;
      FilterObject := ENBindingOverOrganizationFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBindingOverOrganizationFilterEdit.Free;
    frmENBindingOverOrganizationFilterEdit:=nil;
  end;}
end;

procedure TfrmENBindingOverOrganizationShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.