
unit ShowENSITFeature;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSITFeatureController ;


type
  TfrmENSITFeatureShow = class(TChildForm)  
  HTTPRIOENSITFeature: THTTPRIO;
    ImageList1: TImageList;
    sgENSITFeature: TAdvStringGrid;
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
procedure sgENSITFeatureTopLeftChanged(Sender: TObject);
procedure sgENSITFeatureDblClick(Sender: TObject);
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
 // ENSITFeatureObj: ENSITFeature;
 // ENSITFeatureFilterObj: ENSITFeatureFilter;
  
  
implementation

uses Main, EditENSITFeature, EditENSITFeatureFilter;


{$R *.dfm}

var
  //frmENSITFeatureShow : TfrmENSITFeatureShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSITFeatureHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва типу'
          ,'Значення'
        );
   

procedure TfrmENSITFeatureShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSITFeatureShow:=nil;
    inherited;
  end;


procedure TfrmENSITFeatureShow.FormShow(Sender: TObject);
var
  TempENSITFeature: ENSITFeatureControllerSoapPort;
  i: Integer;
  ENSITFeatureList: ENSITFeatureShortList;
  begin
  SetGridHeaders(ENSITFeatureHeaders, sgENSITFeature.ColumnHeaders);
  ColCount:=100;
  TempENSITFeature :=  HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSITFeatureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITFeatureList := TempENSITFeature.getScrollableFilteredList(ENSITFeatureFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSITFeatureList.list);

  if LastCount > -1 then
     sgENSITFeature.RowCount:=LastCount+2
  else
     sgENSITFeature.RowCount:=2;

   with sgENSITFeature do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITFeatureList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSITFeatureList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSITFeatureList.list[i].featureTypeName;
        Cells[2,i+1] := ENSITFeatureList.list[i].value;
        LastRow:=i+1;
        sgENSITFeature.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSITFeature.Row:=1;
end;

procedure TfrmENSITFeatureShow.sgENSITFeatureTopLeftChanged(Sender: TObject);
var
  TempENSITFeature: ENSITFeatureControllerSoapPort;
  i,CurrentRow: Integer;
  ENSITFeatureList: ENSITFeatureShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSITFeature.TopRow + sgENSITFeature.VisibleRowCount) = ColCount
  then
    begin
      TempENSITFeature :=  HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
      CurrentRow:=sgENSITFeature.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSITFeatureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITFeatureList := TempENSITFeature.getScrollableFilteredList(ENSITFeatureFilter(FilterObject),ColCount-1, 100);



  sgENSITFeature.RowCount:=sgENSITFeature.RowCount+100;
  LastCount:=High(ENSITFeatureList.list);
  with sgENSITFeature do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITFeatureList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSITFeatureList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSITFeatureList.list[i].name;
        Cells[2,i+CurrentRow] := ENSITFeatureList.list[i].value;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSITFeature.Row:=CurrentRow-5;
   sgENSITFeature.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSITFeatureShow.sgENSITFeatureDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSITFeature,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSITFeatureShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSITFeature.RowCount-1 do
   for j:=0 to sgENSITFeature.ColCount-1 do
     sgENSITFeature.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSITFeatureShow.actViewExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
 TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
   try
     ENSITFeatureObj := TempENSITFeature.getObject(StrToInt(sgENSITFeature.Cells[0,sgENSITFeature.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureEdit:=TfrmENSITFeatureEdit.Create(Application, dsView);
  try
    frmENSITFeatureEdit.ShowModal;
  finally
    frmENSITFeatureEdit.Free;
    frmENSITFeatureEdit:=nil;
  end;
end;

procedure TfrmENSITFeatureShow.actEditExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
 TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
   try
     ENSITFeatureObj := TempENSITFeature.getObject(StrToInt(sgENSITFeature.Cells[0,sgENSITFeature.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureEdit:=TfrmENSITFeatureEdit.Create(Application, dsEdit);
  try
    if frmENSITFeatureEdit.ShowModal= mrOk then
      begin
        //TempENSITFeature.save(ENSITFeatureObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSITFeatureEdit.Free;
    frmENSITFeatureEdit:=nil;
  end;
end;

procedure TfrmENSITFeatureShow.actDeleteExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSITFeature.Cells[0,sgENSITFeature.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Свойства) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSITFeature.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSITFeatureShow.actInsertExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
  TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
  ENSITFeatureObj:=ENSITFeature.Create;



  try
    frmENSITFeatureEdit:=TfrmENSITFeatureEdit.Create(Application, dsInsert);
    try
      if frmENSITFeatureEdit.ShowModal = mrOk then
      begin
        if ENSITFeatureObj<>nil then
            //TempENSITFeature.add(ENSITFeatureObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSITFeatureEdit.Free;
      frmENSITFeatureEdit:=nil;
    end;
  finally
    ENSITFeatureObj.Free;
  end;
end;

procedure TfrmENSITFeatureShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSITFeatureShow.actFilterExecute(Sender: TObject);
begin
{frmENSITFeatureFilterEdit:=TfrmENSITFeatureFilterEdit.Create(Application, dsEdit);
  try
    ENSITFeatureFilterObj := ENSITFeatureFilter.Create;
    SetNullIntProps(ENSITFeatureFilterObj);
    SetNullXSProps(ENSITFeatureFilterObj);

    if frmENSITFeatureFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSITFeatureFilter.Create;
      FilterObject := ENSITFeatureFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSITFeatureFilterEdit.Free;
    frmENSITFeatureFilterEdit:=nil;
  end;}
end;

procedure TfrmENSITFeatureShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.