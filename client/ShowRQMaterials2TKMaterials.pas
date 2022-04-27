
unit ShowRQMaterials2TKMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQMaterials2TKMaterialsController ;


type
  TfrmRQMaterials2TKMaterialsShow = class(TChildForm)  
  HTTPRIORQMaterials2TKMaterials: THTTPRIO;
    ImageList1: TImageList;
    sgRQMaterials2TKMaterials: TAdvStringGrid;
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
procedure sgRQMaterials2TKMaterialsTopLeftChanged(Sender: TObject);
procedure sgRQMaterials2TKMaterialsDblClick(Sender: TObject);
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
 // RQMaterials2TKMaterialsObj: RQMaterials2TKMaterials;
 // RQMaterials2TKMaterialsFilterObj: RQMaterials2TKMaterialsFilter;
  
  
implementation

uses Main, EditRQMaterials2TKMaterials, EditRQMaterials2TKMaterialsFilter;


{$R *.dfm}

var
  //frmRQMaterials2TKMaterialsShow : TfrmRQMaterials2TKMaterialsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQMaterials2TKMaterialsHeaders: array [1..2] of String =
        ( 'Код'
          ,'Коєф. перерахунку'
        );
   

procedure TfrmRQMaterials2TKMaterialsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQMaterials2TKMaterialsShow:=nil;
    inherited;
  end;


procedure TfrmRQMaterials2TKMaterialsShow.FormShow(Sender: TObject);
var
  TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
  i: Integer;
  RQMaterials2TKMaterialsList: RQMaterials2TKMaterialsShortList;
  begin
  SetGridHeaders(RQMaterials2TKMaterialsHeaders, sgRQMaterials2TKMaterials.ColumnHeaders);
  ColCount:=100;
  TempRQMaterials2TKMaterials :=  HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterials2TKMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterials2TKMaterialsList := TempRQMaterials2TKMaterials.getScrollableFilteredList(RQMaterials2TKMaterialsFilter(FilterObject),0,ColCount);


  LastCount:=High(RQMaterials2TKMaterialsList.list);

  if LastCount > -1 then
     sgRQMaterials2TKMaterials.RowCount:=LastCount+2
  else
     sgRQMaterials2TKMaterials.RowCount:=2;

   with sgRQMaterials2TKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterials2TKMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQMaterials2TKMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQMaterials2TKMaterialsList.list[i].coef = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQMaterials2TKMaterialsList.list[i].coef.DecimalString;
        LastRow:=i+1;
        sgRQMaterials2TKMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQMaterials2TKMaterials.Row:=1;
end;

procedure TfrmRQMaterials2TKMaterialsShow.sgRQMaterials2TKMaterialsTopLeftChanged(Sender: TObject);
var
  TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
  i,CurrentRow: Integer;
  RQMaterials2TKMaterialsList: RQMaterials2TKMaterialsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQMaterials2TKMaterials.TopRow + sgRQMaterials2TKMaterials.VisibleRowCount) = ColCount
  then
    begin
      TempRQMaterials2TKMaterials :=  HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;
      CurrentRow:=sgRQMaterials2TKMaterials.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterials2TKMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterials2TKMaterialsList := TempRQMaterials2TKMaterials.getScrollableFilteredList(RQMaterials2TKMaterialsFilter(FilterObject),ColCount-1, 100);



  sgRQMaterials2TKMaterials.RowCount:=sgRQMaterials2TKMaterials.RowCount+100;
  LastCount:=High(RQMaterials2TKMaterialsList.list);
  with sgRQMaterials2TKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterials2TKMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQMaterials2TKMaterialsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQMaterials2TKMaterialsList.list[i].coef = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQMaterials2TKMaterialsList.list[i].coef.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQMaterials2TKMaterials.Row:=CurrentRow-5;
   sgRQMaterials2TKMaterials.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQMaterials2TKMaterialsShow.sgRQMaterials2TKMaterialsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQMaterials2TKMaterials,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQMaterials2TKMaterialsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQMaterials2TKMaterials.RowCount-1 do
   for j:=0 to sgRQMaterials2TKMaterials.ColCount-1 do
     sgRQMaterials2TKMaterials.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQMaterials2TKMaterialsShow.actViewExecute(Sender: TObject);
Var TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
begin
 TempRQMaterials2TKMaterials := HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;
   try
     RQMaterials2TKMaterialsObj := TempRQMaterials2TKMaterials.getObject(StrToInt(sgRQMaterials2TKMaterials.Cells[0,sgRQMaterials2TKMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterials2TKMaterialsEdit:=TfrmRQMaterials2TKMaterialsEdit.Create(Application, dsView);
  try
    frmRQMaterials2TKMaterialsEdit.ShowModal;
  finally
    frmRQMaterials2TKMaterialsEdit.Free;
    frmRQMaterials2TKMaterialsEdit:=nil;
  end;
end;

procedure TfrmRQMaterials2TKMaterialsShow.actEditExecute(Sender: TObject);
Var TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
begin
 TempRQMaterials2TKMaterials := HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;
   try
     RQMaterials2TKMaterialsObj := TempRQMaterials2TKMaterials.getObject(StrToInt(sgRQMaterials2TKMaterials.Cells[0,sgRQMaterials2TKMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterials2TKMaterialsEdit:=TfrmRQMaterials2TKMaterialsEdit.Create(Application, dsEdit);
  try
    if frmRQMaterials2TKMaterialsEdit.ShowModal= mrOk then
      begin
        //TempRQMaterials2TKMaterials.save(RQMaterials2TKMaterialsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQMaterials2TKMaterialsEdit.Free;
    frmRQMaterials2TKMaterialsEdit:=nil;
  end;
end;

procedure TfrmRQMaterials2TKMaterialsShow.actDeleteExecute(Sender: TObject);
Var TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQMaterials2TKMaterials := HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQMaterials2TKMaterials.Cells[0,sgRQMaterials2TKMaterials.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звьязок Нормативних матеріалів з матеріалами з Закупок) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQMaterials2TKMaterials.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQMaterials2TKMaterialsShow.actInsertExecute(Sender: TObject);
Var TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
begin
  TempRQMaterials2TKMaterials := HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;
  RQMaterials2TKMaterialsObj:=RQMaterials2TKMaterials.Create;

   RQMaterials2TKMaterialsObj.coef:= TXSDecimal.Create;


  try
    frmRQMaterials2TKMaterialsEdit:=TfrmRQMaterials2TKMaterialsEdit.Create(Application, dsInsert);
    try
      if frmRQMaterials2TKMaterialsEdit.ShowModal = mrOk then
      begin
        if RQMaterials2TKMaterialsObj<>nil then
            //TempRQMaterials2TKMaterials.add(RQMaterials2TKMaterialsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQMaterials2TKMaterialsEdit.Free;
      frmRQMaterials2TKMaterialsEdit:=nil;
    end;
  finally
    RQMaterials2TKMaterialsObj.Free;
  end;
end;

procedure TfrmRQMaterials2TKMaterialsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQMaterials2TKMaterialsShow.actFilterExecute(Sender: TObject);
begin
{frmRQMaterials2TKMaterialsFilterEdit:=TfrmRQMaterials2TKMaterialsFilterEdit.Create(Application, dsEdit);
  try
    RQMaterials2TKMaterialsFilterObj := RQMaterials2TKMaterialsFilter.Create;
    SetNullIntProps(RQMaterials2TKMaterialsFilterObj);
    SetNullXSProps(RQMaterials2TKMaterialsFilterObj);

    if frmRQMaterials2TKMaterialsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQMaterials2TKMaterialsFilter.Create;
      FilterObject := RQMaterials2TKMaterialsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQMaterials2TKMaterialsFilterEdit.Free;
    frmRQMaterials2TKMaterialsFilterEdit:=nil;
  end;}
end;

procedure TfrmRQMaterials2TKMaterialsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.