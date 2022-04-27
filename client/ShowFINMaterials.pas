
unit ShowFINMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINMaterialsController, AdvObj ;


type
  TfrmFINMaterialsShow = class(TChildForm)  
  HTTPRIOFINMaterials: THTTPRIO;
    ImageList1: TImageList;
    sgFINMaterials: TAdvStringGrid;
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
procedure sgFINMaterialsTopLeftChanged(Sender: TObject);
procedure sgFINMaterialsDblClick(Sender: TObject);
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
 frmFINMaterialsShow : TfrmFINMaterialsShow;
 // FINMaterialsObj: FINMaterials;
 // FINMaterialsFilterObj: FINMaterialsFilter;
  
  
implementation

uses Main, EditFINMaterials, EditFINMaterialsFilter;


{$R *.dfm}

var
  //frmFINMaterialsShow : TfrmFINMaterialsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINMaterialsHeaders: array [1..19] of String =
        ( 'Код'
          ,'Номенкл. №'
          ,'Назва'
          ,'Од. вим.'
          ,'ПІБ МОЛа'
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код ...'
          ,'...'
          ,'код ...'
          ,'код ...'
          ,'код ...'
          ,'...'
          ,'Ціна розрахункова'
          ,'Кількість матеріалу'
          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Бал. рахунок'
        );
   

procedure TfrmFINMaterialsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINMaterialsShow:=nil;
    inherited;
  end;


procedure TfrmFINMaterialsShow.FormShow(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i: Integer;
  FINMaterialsList: FINMaterialsShortList;
  begin
  SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);
  ColCount:=100;
  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMaterialsList := TempFINMaterials.getScrollableFilteredList(FINMaterialsFilter(FilterObject),0,ColCount);


  LastCount:=High(FINMaterialsList.list);

  if LastCount > -1 then
     sgFINMaterials.RowCount:=LastCount+2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINMaterialsList.list[i].nn;
        Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;
        Cells[4,i+1] := FINMaterialsList.list[i].div_name;
        Cells[5,i+1] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);
        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+1] := FINMaterialsList.list[i].frc_name;
        if FINMaterialsList.list[i].calc_price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;
        LastRow:=i+1;
        sgFINMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINMaterials.Row:=1;
end;

procedure TfrmFINMaterialsShow.sgFINMaterialsTopLeftChanged(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i,CurrentRow: Integer;
  FINMaterialsList: FINMaterialsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINMaterials.TopRow + sgFINMaterials.VisibleRowCount) = ColCount
  then
    begin
      TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
      CurrentRow:=sgFINMaterials.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMaterialsList := TempFINMaterials.getScrollableFilteredList(FINMaterialsFilter(FilterObject),ColCount-1, 100);



  sgFINMaterials.RowCount:=sgFINMaterials.RowCount+100;
  LastCount:=High(FINMaterialsList.list);
  with sgFINMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINMaterialsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINMaterialsList.list[i].nn;
        Cells[2,i+CurrentRow] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+CurrentRow] := FINMaterialsList.list[i].mu_name;
        Cells[4,i+CurrentRow] := FINMaterialsList.list[i].div_name;
        Cells[5,i+CurrentRow] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+CurrentRow] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        Cells[9,i+CurrentRow] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := IntToStr(FINMaterialsList.list[i].budget_core_id);
        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+CurrentRow] := FINMaterialsList.list[i].frc_name;
        if FINMaterialsList.list[i].calc_price = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+CurrentRow] := FINMaterialsList.list[i].bal_sch;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINMaterials.Row:=CurrentRow-5;
   sgFINMaterials.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINMaterialsShow.sgFINMaterialsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINMaterials,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINMaterialsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINMaterials.RowCount-1 do
   for j:=0 to sgFINMaterials.ColCount-1 do
     sgFINMaterials.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINMaterialsShow.actViewExecute(Sender: TObject);
Var TempFINMaterials: FINMaterialsControllerSoapPort;
begin
 TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
   try
     FINMaterialsObj := TempFINMaterials.getObject(StrToInt(sgFINMaterials.Cells[0,sgFINMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMaterialsEdit:=TfrmFINMaterialsEdit.Create(Application, dsView);
  try
    frmFINMaterialsEdit.ShowModal;
  finally
    frmFINMaterialsEdit.Free;
    frmFINMaterialsEdit:=nil;
  end;
end;

procedure TfrmFINMaterialsShow.actEditExecute(Sender: TObject);
Var TempFINMaterials: FINMaterialsControllerSoapPort;
begin
 TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
   try
     FINMaterialsObj := TempFINMaterials.getObject(StrToInt(sgFINMaterials.Cells[0,sgFINMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMaterialsEdit:=TfrmFINMaterialsEdit.Create(Application, dsEdit);
  try
    if frmFINMaterialsEdit.ShowModal= mrOk then
      begin
        //TempFINMaterials.save(FINMaterialsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINMaterialsEdit.Free;
    frmFINMaterialsEdit:=nil;
  end;
end;

procedure TfrmFINMaterialsShow.actDeleteExecute(Sender: TObject);
Var TempFINMaterials: FINMaterialsControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINMaterials.Cells[0,sgFINMaterials.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Матеріали з фин.кол.) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      //TempFINMaterials.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINMaterialsShow.actInsertExecute(Sender: TObject);
Var TempFINMaterials: FINMaterialsControllerSoapPort;
begin
  TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
  FINMaterialsObj:=FINMaterials.Create;

   FINMaterialsObj.doc_date:= TXSDate.Create;
   FINMaterialsObj.calc_price:= TXSDecimal.Create;
   FINMaterialsObj.quantity:= TXSDecimal.Create;
   FINMaterialsObj.price:= TXSDecimal.Create;
   FINMaterialsObj.cost:= TXSDecimal.Create;


  try
    frmFINMaterialsEdit:=TfrmFINMaterialsEdit.Create(Application, dsInsert);
    try
      if frmFINMaterialsEdit.ShowModal = mrOk then
      begin
        if FINMaterialsObj<>nil then
            //TempFINMaterials.add(FINMaterialsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINMaterialsEdit.Free;
      frmFINMaterialsEdit:=nil;
    end;
  finally
    FINMaterialsObj.Free;
  end;
end;

procedure TfrmFINMaterialsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINMaterialsShow.actFilterExecute(Sender: TObject);
begin
{frmFINMaterialsFilterEdit:=TfrmFINMaterialsFilterEdit.Create(Application, dsEdit);
  try
    FINMaterialsFilterObj := FINMaterialsFilter.Create;
    SetNullIntProps(FINMaterialsFilterObj);
    SetNullXSProps(FINMaterialsFilterObj);

    if frmFINMaterialsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINMaterialsFilter.Create;
      FilterObject := FINMaterialsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINMaterialsFilterEdit.Free;
    frmFINMaterialsFilterEdit:=nil;
  end;}
end;

procedure TfrmFINMaterialsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.