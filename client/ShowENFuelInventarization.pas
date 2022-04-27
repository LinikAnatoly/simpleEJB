
unit ShowENFuelInventarization;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuelInventarizationController, AdvObj ;


type
  TfrmENFuelInventarizationShow = class(TChildForm)  
  HTTPRIOENFuelInventarization: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelInventarization: TAdvStringGrid;
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
procedure sgENFuelInventarizationTopLeftChanged(Sender: TObject);
procedure sgENFuelInventarizationDblClick(Sender: TObject);
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
 // ENFuelInventarizationObj: ENFuelInventarization;
 // ENFuelInventarizationFilterObj: ENFuelInventarizationFilter;
  
  
implementation

uses Main, EditENFuelInventarization, EditENFuelInventarizationFilter;


{$R *.dfm}

var
  //frmENFuelInventarizationShow : TfrmENFuelInventarizationShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelInventarizationHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер документа по інвентарізації'
          ,'Дата інвентарізації'
          ,'Код МОЛа, що інвентарізується'
          ,'Найменування МОЛа, що інвентарізується'
          ,'Статус відомості'
          ,'Користувач, що додав інвентарізацію'
          ,'Дата додавання'
          ,'Користувач, який змінив інвентарізацію'
          ,'Дата зміни'
        );
   

procedure TfrmENFuelInventarizationShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuelInventarizationShow:=nil;
    inherited;
  end;


procedure TfrmENFuelInventarizationShow.FormShow(Sender: TObject);
var
  TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
  i: Integer;
  ENFuelInventarizationList: ENFuelInventarizationShortList;
  begin
  SetGridHeaders(ENFuelInventarizationHeaders, sgENFuelInventarization.ColumnHeaders);
  ColCount:=100;
  TempENFuelInventarization :=  HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInventarizationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENFuelInventarizationFilter(FilterObject).orderBySQL :=  ' dategen desc, molcode, ENFUELINVENTARIZATION.CODE desc ';
  end;

  ENFuelInventarizationList := TempENFuelInventarization.getScrollableFilteredList(ENFuelInventarizationFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuelInventarizationList.list);

  if LastCount > -1 then
     sgENFuelInventarization.RowCount:=LastCount+2
  else
     sgENFuelInventarization.RowCount:=2;

   with sgENFuelInventarization do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInventarizationList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelInventarizationList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFuelInventarizationList.list[i].numberGen;
        if ENFuelInventarizationList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENFuelInventarizationList.list[i].dateGen);
        Cells[3,i+1] := ENFuelInventarizationList.list[i].molCode;
        Cells[4,i+1] := ENFuelInventarizationList.list[i].molName;
        Cells[5,i+1] := ENFuelInventarizationList.list[i].statusRefName;
        Cells[6,i+1] := ENFuelInventarizationList.list[i].userAdd;
        if ENFuelInventarizationList.list[i].dateAdd = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENFuelInventarizationList.list[i].dateAdd);
        Cells[8,i+1] := ENFuelInventarizationList.list[i].userGen;
        if ENFuelInventarizationList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDateTimeWithDate2String(ENFuelInventarizationList.list[i].dateEdit);
        LastRow:=i+1;
        sgENFuelInventarization.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFuelInventarization.Row:=1;
end;

procedure TfrmENFuelInventarizationShow.sgENFuelInventarizationTopLeftChanged(Sender: TObject);
var
  TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelInventarizationList: ENFuelInventarizationShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelInventarization.TopRow + sgENFuelInventarization.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelInventarization :=  HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;
      CurrentRow:=sgENFuelInventarization.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInventarizationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENFuelInventarizationFilter(FilterObject).orderBySQL :=  ' dategen desc, molcode, ENFUELINVENTARIZATION.CODE desc ';
  end;

  ENFuelInventarizationList := TempENFuelInventarization.getScrollableFilteredList(ENFuelInventarizationFilter(FilterObject),ColCount-1, 100);



  sgENFuelInventarization.RowCount:=sgENFuelInventarization.RowCount+100;
  LastCount:=High(ENFuelInventarizationList.list);
  with sgENFuelInventarization do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInventarizationList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelInventarizationList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFuelInventarizationList.list[i].numberGen;
        if ENFuelInventarizationList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelInventarizationList.list[i].dateGen);		  
        Cells[3,i+CurrentRow] := ENFuelInventarizationList.list[i].molCode;
        Cells[4,i+CurrentRow] := ENFuelInventarizationList.list[i].molName;
        Cells[5,i+CurrentRow] := ENFuelInventarizationList.list[i].statusRefName;
        Cells[6,i+CurrentRow] := ENFuelInventarizationList.list[i].userAdd;
        if ENFuelInventarizationList.list[i].dateAdd = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelInventarizationList.list[i].dateAdd);		  
        Cells[8,i+CurrentRow] := ENFuelInventarizationList.list[i].userGen;
        if ENFuelInventarizationList.list[i].dateEdit = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelInventarizationList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelInventarization.Row:=CurrentRow-5;
   sgENFuelInventarization.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelInventarizationShow.sgENFuelInventarizationDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelInventarization,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuelInventarizationShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuelInventarization.RowCount-1 do
   for j:=0 to sgENFuelInventarization.ColCount-1 do
     sgENFuelInventarization.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuelInventarizationShow.actViewExecute(Sender: TObject);
Var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
 TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;
   try
     ENFuelInventarizationObj := TempENFuelInventarization.getObject(StrToInt(sgENFuelInventarization.Cells[0,sgENFuelInventarization.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInventarizationEdit:=TfrmENFuelInventarizationEdit.Create(Application, dsView);
  try
    frmENFuelInventarizationEdit.ShowModal;
  finally
    frmENFuelInventarizationEdit.Free;
    frmENFuelInventarizationEdit:=nil;
  end;
end;

procedure TfrmENFuelInventarizationShow.actEditExecute(Sender: TObject);
Var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
 TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;
   try
     ENFuelInventarizationObj := TempENFuelInventarization.getObject(StrToInt(sgENFuelInventarization.Cells[0,sgENFuelInventarization.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInventarizationEdit:=TfrmENFuelInventarizationEdit.Create(Application, dsEdit);
  try
    if frmENFuelInventarizationEdit.ShowModal= mrOk then
      begin
        //TempENFuelInventarization.save(ENFuelInventarizationObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelInventarizationEdit.Free;
    frmENFuelInventarizationEdit:=nil;
  end;
end;

procedure TfrmENFuelInventarizationShow.actDeleteExecute(Sender: TObject);
Var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelInventarization.Cells[0,sgENFuelInventarization.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Інвентрізаційна відомість) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelInventarization.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelInventarizationShow.actInsertExecute(Sender: TObject);
// Var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
   ENFuelInventarizationObj:=ENFuelInventarization.Create;

  try
    frmENFuelInventarizationEdit:=TfrmENFuelInventarizationEdit.Create(Application, dsInsert);
    try
      if frmENFuelInventarizationEdit.ShowModal = mrOk then
      begin
        if ENFuelInventarizationObj<>nil then
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelInventarizationEdit.Free;
      frmENFuelInventarizationEdit:=nil;
    end;
  finally
    ENFuelInventarizationObj.Free;
  end;

end;

procedure TfrmENFuelInventarizationShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuelInventarizationShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelInventarizationFilterEdit:=TfrmENFuelInventarizationFilterEdit.Create(Application, dsInsert);
  try
    ENFuelInventarizationFilterObj := ENFuelInventarizationFilter.Create;
    SetNullIntProps(ENFuelInventarizationFilterObj);
    SetNullXSProps(ENFuelInventarizationFilterObj);

    if frmENFuelInventarizationFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuelInventarizationFilter.Create;
      FilterObject := ENFuelInventarizationFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelInventarizationFilterEdit.Free;
    frmENFuelInventarizationFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuelInventarizationShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.